Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DEF3446A6
	for <linux-usb@vger.kernel.org>; Sun, 18 Oct 2026 02:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792290726; cv=none; b=Pb3CheckZL2ovQIMVFY4inwzmzM9IG8B/amuuIzyl5VsVDS3kGb8pjrn6Sx+CrmLWSZl3z/fEQVU55qS4yFXURQVcIWMzw3M+DwcoIHXY1DsjfPIFqDTfWUNtCPIeHRUn32NjIDuia/WKrGKWHRDOmtZ244d3PvmomAlBJxdgmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792290726; c=relaxed/simple;
	bh=SonTQqI1E4gmDWfoGEcsRKX7iGhRoCOiAf9Un14E/iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfJJ7khej11DghOn2JdDtGzgmqdjRZJzm/axNAdksyBDid2vsL5njvGPZ5ZOYGWH10T3I2uzfKJouOn3mc0/y7Na+FAUxhxYHaOFxC33jhEAasvUr9ePjwfb2exAr5vLkyoof1lxgYbSaDp2ZWYjBminBJ20SXyCiIgIA5LsepA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=r6DC0X/y; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="r6DC0X/y"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-534e6545939so7283281cf.3
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2026 19:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792290724; x=1792895524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SonTQqI1E4gmDWfoGEcsRKX7iGhRoCOiAf9Un14E/iE=;
        b=r6DC0X/y7++3e4i0SySll5DwBR80GzdpSX3Siw/t/ZJpwnhiZm0Ox4tAWVSz0YWNTs
         RIoP4k3Zl7CRhBR+eAOfgJDsoim8xdq8yvVgm+UoxGpgrJuawggf1l1XI3Gj0XeoJli/
         Dihhkt+tVK3Vapr/bryK9lnDg4lWXEGMCOTATOxqJgx1CNXgtiFuL9CohFKvxDKQNeEq
         b4tTE9lNKQoe4U93ya2hzplptV21yoqpx+5geamJ/n7qJiv3/63w1dhKA+HCoR2ge5G3
         snBnIZGFqut1etfqPJS6BX6c5PI78BKm5Vn7k23s17OvNLreEMSeQkv+6Nx9LkCxm5oW
         C1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792290724; x=1792895524;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SonTQqI1E4gmDWfoGEcsRKX7iGhRoCOiAf9Un14E/iE=;
        b=r9+y/RruyDLBYcMmtiw/eTG0u5yr6Q4xSry5D4a2YADzm57SgQPy+zfpvVohmfBViC
         4AF0qx+Ga3YSqagutB9o6FaKm1od2YnyZtiI+RN+nwXlVE1uIZUMRHyl/xeOPImj+/tR
         36ryxnMFdg/l49ezciHjc+CJXD2Tp/UV4QCy8SMerHE6XCtS1hIu2h+5unat8WbarW6/
         32Fg0+yviNQxRK+ty1ztRRfat9Gliakzjrk8qEdLWsBE9pwyGiIRzErKLFnHUlN48V8j
         y9H3foKJ4qqQpoi/ALr3X/CpRIpMV9UNSpgOEe4ad3vHYk1f2ll/Uq+mve59f6P1SfiR
         ujEw==
X-Forwarded-Encrypted: i=1; AKwUvByEyuzjZqiovZq4ZQuPZuMtUj2aO+p4tEhvZGjt4FQI3zUqrSwsnrPhz9fZGBJq6eTDFQvmHdFZ+tU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9laxpZAL/clrgpMvGReUd7ZPjTMz0S3BbGENsal0q7BMEGiSC
	14T2LEHlhT4AKSnrLgWfoQNqah5oIYW7Q+j66Gxbpsl1UG5SU+ia72FAGCLz+0kMCA==
X-Gm-Gg: AYBFou2ogLPHgdl0uBrR8V4dpMSa0iM5JWGCvfaY8p8d7fIfkNv+UaFWUR6KzK1oRP/
	nE0LpHZmoLsZ4Q3gjd30DTp4qc0yXqcLf8x+Naz4cgLzxPN6p0R0SoiGTY31D5jXyja5UJN7EMA
	SUE/eXkz/m2NpcqExmDbTej9515k3AlJSTyhsKi5RBnrTD6xJGoeu3hNuwdDmzkNjxxFrHc1vbr
	p8RhMquIO4kp5fShiGgK1+5zliYO0U0CZI84iAwXVzI83DKiDAe64Cw/80CRrFZFPZCalaOeP+M
	llcqPZTxzHTtDZJbmTyvHodrvreNkYnsNDhzFSzt5ZBzqpvvd+GE/dGNkaP+cpbuagZwjcbjHgL
	yzhi/XKZjVPvi5B3m/p1rBQZ3YSnjWKLBt3DBLBFBgY04PP7/B506mhzywDNEAs30G9eI+RrL/9
	FtNF/45zErmBrTy+Pdl9Wg2BqX925DBpEI+5EfKnHfx5KOWXt4LnO9aMAmlJ29x25i1dDP49c=
X-Received: by 2002:a05:622a:44e:b0:533:367b:3479 with SMTP id d75a77b69052e-53645faa298mr58825371cf.14.1792290724083;
        Sat, 17 Oct 2026 19:32:04 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362a9bbad2sm63812751cf.18.2026.10.17.19.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:32:03 -0700 (PDT)
Date: Sat, 17 Oct 2026 22:32:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: m-amirpour <ampr.mhd@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ohci-omap: handle root hub overcurrent
Message-ID: <e9181871-e1d0-439e-9764-631581690ed4@rowland.harvard.edu>
References: <20261018015747.246611-1-ampr.mhd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261018015747.246611-1-ampr.mhd@gmail.com>

On Sun, Oct 18, 2026 at 05:27:47AM +0330, m-amirpour wrote:
> Handle overcurrent GPIO interrupts, disable port power when
> overcurrent is detected, and report the status through the
> root hub port status.

How did you develop and test this?

Alan Stern
