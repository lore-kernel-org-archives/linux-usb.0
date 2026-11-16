Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853953;
	b=a8Swuh/iYRRIp89O5FhkfPPSDCRGw5Bo674l5xGDHCqnElJ9C7z1djdesVVKllJmfhRV
	 1FsyMiUH7k/2gY7ssPTQ+RzF6Jq8AwKabY6RTx0D/6ZLodk56qcFW0yt1GNHIm91ScW5p
	 HFagZX5Daf+dXuwnNkivJWqjhJoPOHB7bRokf8kP9oBbKk499rjBOxx5ZtnJEoPPDeofK
	 wyOSV48LZjPmjmbGYEr0JADNYn0EaBRwxFwkfu1jdrCi14WIAZiUSMksTWfhbA2/8ysLR
	 xT4olRfKTBVB3ZY8cgAKWANirF6sSnVrvuWOOLzPZ9ZoEKEBJlIzUz9BQRQ4nzEMJ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=6Mzo85W8swCv3RAdLaxrajaoqyjLMw0IEsk0L6cWkMQ=;
	b=zypvW2svMNDFHPqYmyB58Pi0CqkWJ4ZbVfftoMk7Dcc7NfY7pSOqpoHL9R5BVzG3v4/S
	 48p6iVoL/r75794WxUvpJDYklLGCiPWfSNUmW8PO6MQwb+JpxI7Cy3Ns+TPU5LEkR0z0e
	 lkvjdN2N6H1m+bOkyOV7TCHx/H1hctUYRuhjh9e5HVbB39uG4OZxBqJhLF+3J13RLOOpn
	 shmeTNDNu0v6A3e61zJlAVpJpRyLRzY9uXjBROYP9pkL28HfWTMfbYp1bY8bUfLTZUh1M
	 0OqoQfoDRbl9sPRFGcFLjVhETD9jOmIH4sdoPgWECFgh/FyhVjC1WGg9NYYG3hM2Y8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ntWJhQYB;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B524606A322
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 18:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B524606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ntWJhQYB
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b3a73a82a1so359160a91.2
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 10:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794853952; x=1795458752; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Mzo85W8swCv3RAdLaxrajaoqyjLMw0IEsk0L6cWkMQ=;
        b=ntWJhQYB1yJzSH8aUxbWKvb1niSnSub2ECTHxW+LY8GnZM2AncVortGGieoM8zPtGM
         YPMXdWxPy0wf3a3kEYpSW4gy1V5BtZKQBFG9Een2W2LNqaEXxSyN+f+zdTDt07p5o+0S
         FT9UtIduOQXUWHO3XapZ/yCZMXUy0fTFZJYNvvd+lIil1ZJxkGsxHS2yN6Ibeuo7Fg4H
         P+2hKJV/ZBaE+K00apr9SisD55/YebHKMuU8VYCvSEOHaE9X6dt5BaKsnKItPWu2TEzG
         5Hm0K4CzEHkg0x2BEa8eQcTcn2RmQh1cHcmFBf+V/klCIm3VMLo3AJEwTChgi/HnglA/
         N4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853952; x=1795458752;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6Mzo85W8swCv3RAdLaxrajaoqyjLMw0IEsk0L6cWkMQ=;
        b=FODacJIsdc61VV3KXoaIxglPewcq+fLarP1xkhAMLei0LIk8wrk/8BNJaM4DAdLnJF
         h+Wxw80CIQozIm7iIE8ANxNa5ccmAQf72Ot9P7gTJxPx/it5CbPEsW/Ysl4PDEBK2GU/
         dD4//LsU0b+cbUO9nCPmOD1M7tHw+aunVe1xISMt9vPGel4+pQSfVBGQg4nbQt3wC+mV
         Z5buKifBn5uZTJZ6FBvUZSkJBL36OjCx9pVqYEBG3vOc/1YPhKOWwexlNAlF9hd0VJtX
         9UfZpU2/F2qeQdP2Daei5ENlT3yQBhT+ns0ID4JXWmXAmbvXWRvDjzgzbOZBIfhihIml
         JjoA==
X-Forwarded-Encrypted: i=1; AL+hErHy0cpEglpxBoBmUEqSWPRnDqiSFl/SuKoeskDvD5qyCF9LrwbXidvzT00cHp+sL76MrDr1lxOjVVE=@vger.kernel.org
X-Gm-Message-State: APuU4Z921lnIaHwgHlv1OL5CQRXZfjTNO9E8Tcn2bq9tBkubjPQLzoXt
	dyNYLQE2I2ZnFLGIdH9ZbUos9fpcaPNZG/uduQdXVblnyiNtPD99IybXozj+EMALlRKElWlQCds
	W5htrjVlaZg==
X-Received: from plai1.prod.google.com ([2002:a17:902:c941:b0:2eb:16af:1567])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:da86:b0:3ab:36c4:b500
 with SMTP id 98e67ed59e1d1-3b1b089e0ffmr12560971a91.5.1794853951522; Mon, 16
 Nov 2026 10:32:31 -0800 (PST)
Date: Mon, 16 Nov 2026 18:32:22 +0000
In-Reply-To: <20261029125143.1744481-2-phasta@kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261029125143.1744481-2-phasta@kernel.org>
X-Mailer: b4 0.17-dev
Message-ID: <179485394213.2938203.5775705349664994300.b4-review@b4>
Subject: Re: [PATCH] usb: gadget: f_fs: Remove deprecated dma_fence->ops
From: Neill Kapron <nkapron@google.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Neill Kapron <nkapron@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	"=?utf-8?q?Christian_K=C3=B6nig?=" <christian.koenig@amd.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Paul Cercueil <paul@crapouillou.net>, "=?utf-8?q?Nuno_S=C3=A1?=" <nuno.sa@analog.com>, Sam Day <me@samcday.com>, 
	Michael Bommarito <michael.bommarito@gmail.com>, 
	Gabriel Prostitis <prostitisgabriel@gmail.com>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

> The dma_fence_ops function ops->release() has been deprecated because it
> prevents drivers from unloading. f_fs's implementation merely frees the
> fence. The dma_fence backend performs this deallocation automatically in
> the correct manner if ops->release() is not implemented.
> 
> The backend simultaneously correctly frees struct ffs_dma_fence since
> struct dma_fence is its base class.
> 
> Remove ops->release().
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/usb/gadget/function/f_fs.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index c64a268e98a4..e8672b37e890 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1479,18 +1479,9 @@ static const char *ffs_dmabuf_get_timeline_name(struct dma_fence *fence)
>  	return "";
>  }
>  
> -static void ffs_dmabuf_fence_release(struct dma_fence *fence)
> -{
> -	struct ffs_dma_fence *dma_fence =
> -		container_of(fence, struct ffs_dma_fence, base);
> -
> -	kfree(dma_fence);
> -}
> -
>  static const struct dma_fence_ops ffs_dmabuf_fence_ops = {
>  	.get_driver_name	= ffs_dmabuf_get_driver_name,
>  	.get_timeline_name	= ffs_dmabuf_get_timeline_name,
> -	.release		= ffs_dmabuf_fence_release,
>  };
>  
>  static int ffs_dma_resv_lock(struct dma_buf *dmabuf, bool nonblock)

This makes sense to me. 

Reviewed-by: Neill Kapron <nkapron@google.com>

-- 
Neill Kapron <nkapron@google.com>
