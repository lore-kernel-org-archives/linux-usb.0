Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794006805;
	b=jtiNHZ/ukNybPZe4mKqQUoYIUYUqUGdqATLhMwGVxsfTx+xptMh5oYnsJAWRSkvVYXU/
	 oBdhE9M3lIRsuCGEl5yRbhSqrrlHh9OYY/t1uTT0giN0Iz7orwwvL6cgUQUpobKCZ9mXH
	 Yox825kMoMl4g57G3W5WBcTzzaYbBHgRWtpyPjPlJcnaLomDnVnSZKG7UTNyVZbcK2YdR
	 cU4oX6Ev6xHDxldSW+2uGTXnBDyDnhDtYJbrgihwh36O233ynHAxjxM8z04wA05e3ij/6
	 2p3sUSfd+2l3JMxQ5lQ/nNzb1s2p5pVSJeDGfT+6oc+Qe9Ocybxn8qYLrd79zkXNPjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794006805;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9IS5BlkYym1kxYWytdUXxpcm7e0CdhXOBJ3wEJjyuDA=;
	b=XHj6aUpyyrCF0bJUX0VcynrsvgBY0pQoLQkL7jnc6VN8Qk2jDD91WxJfIFY1MB0ZEHsk
	 JyjxDmCU4kk6H8x6xceUh053W28Od6EcSY06tl+GcAdJuK9Iv5Y8EIAs9wv85EukujFfI
	 BxOcTs9LNILzxJtOU8Z1C7RSk5q7o4CyQmPhXeqAhq53bnUcm++hDU2gULd/s3+bcq6b5
	 TTe8hlBNkn6GUTODjtKIWuuhm59oLzXWo6k82GI1JNMwU5vwr4NuHACoAdzNKSzJdm0Pv
	 2TnhRWFDB+Z6vspxiCjKP9/nD6ZX0qHJSzkaOJIivf9DhI8pGf6DqzMBVTFsmByZOkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OlXBubjY;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15459606A326
	for <linux-usb@vger.kernel.org>; Fri,  6 Nov 2026 23:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15459606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OlXBubjY
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b1015a4259so257290a91.0
        for <linux-usb@vger.kernel.org>; Fri, 06 Nov 2026 15:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794006804; x=1794611604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9IS5BlkYym1kxYWytdUXxpcm7e0CdhXOBJ3wEJjyuDA=;
        b=OlXBubjYQZlHyXzGQkKHMmNtqkFPaecQv/xoi4yZIAlg5WUsMxHkVEEQf9rrBjLhT+
         sBJR6PFFUDHxdxuYbake6JZIwUb7ebGg4yy+nob1a+CDzuA/3l8DcFHXkvKBFF80ms3s
         fyWOZ1AbRabafLEDifYLZYiFCItv+kOFSnMBH1EWN3E0mBTaWhgZTcOAwvxLXdsZngpI
         RAOU1rlcJR+Xf5zKARPoHeYmP2wNmJ6WJo5jmZY5OnevUW/wbQKkb62wWt6iOQr24w6T
         CS+dsjqqKIl11isgTMLu7CCGFujJ5DRB87rVl/QDPT/reU1bO4RRswh8kjznZsyVq4iL
         NtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794006804; x=1794611604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9IS5BlkYym1kxYWytdUXxpcm7e0CdhXOBJ3wEJjyuDA=;
        b=T+hC7eTTySE1kkXCT1d9IMfsDdV5mKSUdR3sRluJ9yD1Bxq+ZU6sdmWJ1n6mPZVMgs
         /ntm/TCwJc8FLVM4kM8QMI4UJE6OLLGAm26VR8Nb7b+J3Xypln/V3HXLk9ZKAJbEgOsC
         BK5Tao/LQ+B4P515asChv+K3NCbF+6ky/mLYB8qrTLzCu71zqkm/JICuHG/OHg5I69Na
         xYDf8q6Jsj2Gl8iAWcYPo8POdant1ZlaYzwkdbYwHjJzWRelD/CsjoGkrRFuax82cKGR
         8t24Bd9k8UYfcS5ytxIuer6RqetUPfyBmQcGHSVToKV8evsB7N/PZvTioPKL5mOIh+ha
         Q6Mg==
X-Forwarded-Encrypted: i=1; AL+hErGkcy1VMF3mNW59+qcLDtJEEFqGHCi4KzAVPybkBnIcc0KKdtcTH5vs36rKSTiDLFnFeOt2JN0Lmeo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lDsWp4hJm+i4GbyLG0RwqrslOIoTZB2j7zSts5ckHZDF0f7lX
	KONd8GtAUNfaUHYemtX/GJ0ZueGvaBxA4ibHSpEWrxeIycMjhmuks1eZ3l8D1HLbra9NzJOFx4O
	kRP9BZA==
X-Gm-Gg: AYBFou0PQZmpEcT1g26ix7+HbPgZdL2PlFlGxkUcVa4NQW0/gNVWJug0fGI/6U6hzmB
	sqI7iRO85tmPlpTw2O7TArQDhVKmALFCELc2pfi7g61/Hb/0TcluEOblt9rex9tRgrnp89PWJJA
	SGpFnF1JYNWrnl/fH7zkyvibp/X8BFDBKorgopbc4ovlexOiz4Y08/NPpHERFZviH8fOjv/scV9
	eeYvvIuOJal3b8uPFFdlux0mq7vTnemvwBPwHqNDOz4jlP+MxU50cCvVKjEaeivxnk8qsqjlOxL
	HOrp7WSoUIR5IEd8hKBPrk7hK+ul1ag4hUQurgMGPmup7Dr+CgvKP2fpop5a7YmjHf3R6kor4BK
	77sQS6zvDQWCn1kJvapnT+ZYWNgmD4HXygGMZrF7nhZ2VJe99gA4T1udiOiUvtLlylSPBhjhGBn
	BPMwdFHGoLNqhCY741mm9WjZWF1d67SEUSkrxRPyVHy6CjJtqq2hQ7tC3gJjXswGETftw8d2zLm
	GRw2NH6YhEkw2ABDEuWWdbyvF+DjBrPydwSNKeoZSdLgXDiQeeI3OcWGSnmmmyB45W29aJ4P0qM
	Rxmd80TvTCNdjaRv9Z0VG3mP2odBnVL3ys6RAPXQeQsigxAU08U2vyeaUfk9wX9Ljqt+7Q==
X-Received: by 2002:a17:90b:46:b0:3b0:78c8:d56e with SMTP id 98e67ed59e1d1-3b0db6ca00amr3908342a91.27.1794006803903;
        Fri, 06 Nov 2026 15:13:23 -0800 (PST)
Received: from google.com (162.127.105.34.bc.googleusercontent.com. [34.105.127.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1058a7b29sm609847a91.10.2026.11.06.15.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:13:23 -0800 (PST)
Date: Fri, 6 Nov 2026 23:13:19 +0000
From: Neill Kapron <nkapron@google.com>
To: Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk, me@samcday.com,
	michael.bommarito@gmail.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/3] usb: gadget: f_fs: simplify error handling using goto
Message-ID: <au5fD9XTLVypQHI7@google.com>
References: <20260901120908.14386-1-ingo.rohloff@lauterbach.com>
 <20260901120908.14386-2-ingo.rohloff@lauterbach.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901120908.14386-2-ingo.rohloff@lauterbach.com>

On Tue, Sep 01, 2026 at 02:09:06PM +0200, Ingo Rohloff wrote:

> +	// It's an AIO request

Nit: please use /* */ style comments to match the surrounding code.

>  
> -		req->context  = io_data;
> -		req->complete = ffs_epfile_async_io_complete;
> +	io_data->buf = data;
> +	io_data->ep = ep->ep;
> +	io_data->req = req;
> +	io_data->ffs = epfile->ffs;
>  
> -		ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
> -		if (ret) {
> -			io_data->req = NULL;
> -			usb_ep_free_request(ep->ep, req);
> -			goto error_lock;
> -		}
> +	req->context  = io_data;

Nit: since we're already changing this line, can you cleanup the double
spacing?


Other that the two minor nits above, this looks reasonable. Since patch
2 shouldn't go in, can you resend this separately with the above items
addressed?

Thanks,
Neill
