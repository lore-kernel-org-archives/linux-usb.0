Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168271;
	b=LRyOoPRnmxWAib7lTg4tMXphpKwHneTMwVJtIYzEvdmUI4gqhJmCdaWjjmPZOrNGDOoA
	 eE7scep2wtZXUunD9MtVQVLOMEhifDzdH1H8bwsdnAz43lYVDD0D3V8O0fqJMRhX4xWgi
	 l7h7XELsoGg5i+ywfYaRxaPL8QQQD3ZAodWvsP75FBh1XMrHy4fJWaiQTYUIGm/Q/i5gj
	 5O2ubI+5aJyVAo9wtJtg9tQN/DG5SCUWuZQ/7gO7yN/zXzEeR/Q4yZM1mSBBrI3CP9GEQ
	 sTdhd5DBPaQ6CHjDl8LgGk+rUzNP9WEIwOoFX7xGgTko4iVRu+fkeSB6o3oIdRoShlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168271;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Fx/1+GzdH4oxW4fuPymVf8niRtu3BL5cPEdk/AG28PI=;
	b=QbgyWwhPKTHsPtCyUcxsfVcYbgTDOj3aPWDBYoWsU/rClSPsRF5xisaU/xaBm4O2iHAN
	 6m1gpA2uwHgd0j3HDqwdeHQubgAf+s8NKbjV4IPKaRCmJpjafHDxVQTNWFmNhRtI0FK5P
	 dEyaYnIKvwM1LVWgrP1IL78eIdezcUa5HXg+7L/hitE5g09lzB1swLdiGjDf2uLSbKqKO
	 oy+9HU4tHQMt0FdTycK/qNaIFzrq0uG9LrdDE6bbjqY09ofi+QBHpuxkQXPcL08VmzESz
	 4ua6jTThUeOUImt5EFA1PIYwsqXIP9FLEPPWsQeVETqb6jyDC4RxnzB1YoE+s86d/ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Adtd6qp9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B738C60A2601;
	Fri, 20 Nov 2026 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Adtd6qp9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65E31F000D2;
	Fri, 20 Nov 2026 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795168271;
	bh=Fx/1+GzdH4oxW4fuPymVf8niRtu3BL5cPEdk/AG28PI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Adtd6qp9NZfpce1sJk3XIlMtWy6zpTcuSNlAXMdLlUIkxg2sFnQEcceUi7hx+v21k
	 RrebCae+Geym09y9GDzP/9aYAaHryBiEPKaBaIMDFdkjBgmDSZ1uP5Pa6Q/+2b+Em1
	 G1FAEtYRAdkN3Qpa2jdTrWD6HazxKoRGMLmXn/Es=
Date: Fri, 20 Nov 2026 10:51:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: bolewara@gmail.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+38bab69d2760cc99cfbe@syzkaller.appspotmail.com,
	syzbot+a4f65284f1451010b0a8@syzkaller.appspotmail.com
Subject: Re: [PATCH 1/2] usb: gadget: f_uac2: fix invalid-free in srate
 configfs store
Message-ID: <2026112000-shed-motor-c5f0@gregkh>
References: <20260804-f-uac-srate-invalid-free-v1-0-2c980378cdf5@gmail.com>
 <20260804-f-uac-srate-invalid-free-v1-1-2c980378cdf5@gmail.com>
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
In-Reply-To: <20260804-f-uac-srate-invalid-free-v1-1-2c980378cdf5@gmail.com>

On Tue, Aug 04, 2026 at 11:13:23PM +0530, Anuj Bolewar via B4 Relay wrote:
> From: Anuj Bolewar <bolewara@gmail.com>
> 
> The store path for the p_srate/c_srate attributes calls kfree() on
> split_page after it has been advanced by strsep(). When the first
> token fails to parse, strsep() leaves split_page pointing into the
> middle of the kstrdup()'d buffer and the subsequent kfree() triggers
> a KASAN invalid-free.
> 
> Keep the original pointer returned by kstrdup() and free that
> instead.
> 
> Reported-by: syzbot+38bab69d2760cc99cfbe@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=38bab69d2760cc99cfbe
> Reported-by: syzbot+a4f65284f1451010b0a8@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=a4f65284f1451010b0a8
> Fixes: a7339e4f5788 ("usb: gadget: f_uac2: Support multiple sampling rates")
> Assisted-by: deepseek:v4-pro
> Signed-off-by: Anuj Bolewar <bolewara@gmail.com>
> ---
>  drivers/usb/gadget/function/f_uac2.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
> index 897787d0803..1ea1bedef9a 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -2013,6 +2013,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
>  {									\
>  	struct f_uac2_opts *opts = to_f_uac2_opts(item);		\
>  	char *split_page = NULL;					\
> +	char *split_page_orig = NULL;					\
>  	int ret = -EINVAL;						\
>  	char *token;							\
>  	u32 num;							\
> @@ -2026,7 +2027,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
>  									\
>  	i = 0;								\
>  	memset(opts->name##s, 0x00, sizeof(opts->name##s));		\
> -	split_page = kstrdup(page, GFP_KERNEL);				\
> +	split_page_orig = split_page = kstrdup(page, GFP_KERNEL);      \
>  	while ((token = strsep(&split_page, ",")) != NULL) {		\
>  		ret = kstrtou32(token, 0, &num);			\
>  		if (ret)						\
> @@ -2037,7 +2038,7 @@ static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
>  	};								\
>  									\
>  end:									\
> -	kfree(split_page);						\
> +	kfree(split_page_orig);						\
>  	mutex_unlock(&opts->lock);					\
>  	return ret;							\
>  }									\
> 
> -- 
> 2.53.0
> 
> 

Does not apply to the usb-linus branch :(
