__device__ void MM_Solve (                         // ... = function name
		float const * parameters,
		int const n_fits,
		int const n_points,
		float * value,
		float * derivative,
		int const point_index,
		int const fit_index,
		int const chunk_index,
		char * user_info,
		std::size_t constuser_info_size)
{

	///////////////////////////// value //////////////////////////////

	REAL *x_values = (REAL*) user_info; //reinterpret `user_info` as an array of REALs
	
	REAL x = x_values[point_index];

	REAL const * p = parameters;
	value[point_index] = (x*p[0]) / (p[1] + x);

	/////////////////////////// derivative ///////////////////////////

	REAL *current_derivative = &derivative[point_index];
	
	REAL xx = (p[1] + x);

	current_derivative[0 * n_points] = x / (p[1] + x);
	current_derivative[1 * n_points] = (-x * p[0]) / (xx * xx);

}