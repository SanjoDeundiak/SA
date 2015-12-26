function X_norm = NormalizeData(X)
    min_X = min(X);
    range = max(X) - min_X;
    X_norm = bsxfun(@minus, X, min_X);
    X_norm = bsxfun(@rdivide, X_norm, range); 
end

