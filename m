Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E02916F288
	for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188328; cv=none; b=FikMejX4zFtCSecIU2Y58b65V6oxxSae9gXtaDT0ZUEB5/DfsveH+jD+zQ9Le9csL1UL6xpi7LxZYWQeHGOTVzP3jW5J/1X0gdNzPyH5ewZpBEBNcEZtgX/B1rgrMQU3VaV2l3TGadq3J/oFqsIj2eyShWXAhBx2JmBKj4zRUj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188328; c=relaxed/simple;
	bh=3X5bF77aOOgRxbUh9C9RVa5EU0OKKkrEkiPrRbuhc+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyXPTuctZ+ZirAkuuhDaQ+dqsarCiG30lX1m/vuFtzVwNSI/9Z/rd61iTgi/46N+wtDeXFYqg0/JjLVXiAhGWUC4a/l/WR5m+N2oYlRqRjEDxH7GRuWVOMuSJYnuhoKOYZdHeYJP24QM5rulMOkjg7u/MOAL/XXZ/plRaZsh4vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahwuWKbY; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahwuWKbY"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4ae3e201cso3281700e87.2
        for <linux-usb@vger.kernel.org>; Mon, 31 Aug 2026 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788188324; x=1788793124; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m3XoILvJ3RaNHwju2reUtm54LguvYTKnFc3Vc9HYR5g=;
        b=ahwuWKbYAT76wuNNmxUEkoqgYPW1//RO3V+pk7cpW33QtfqvIHz+3OYecbEhzGn6Ja
         Y4gvRqJYaxKuFETIFCdUK+UH+pZSNyVcgfeCzCpYwWISPoRRDkcKX51eyRWl6J5TeKx6
         5vZWJXK8JNuOZLRGwCai5JYjn6P1kg9IR2w9Wz9Po6JmLkvAshCcJQABl3FvF1gsika4
         rVjLMNNMMDJK1W3rclRd7o8eoJ7kDptVgLljcMHlvonEx2XwvW2Q1iQxoRxIh68wWYBf
         N9dmo+ZPCOYUodFDMnOy/8h5IkKNNzLc8xfokEiG469eX/zLtk7HNTSCmdF8uIc/uaQK
         XS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188324; x=1788793124;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m3XoILvJ3RaNHwju2reUtm54LguvYTKnFc3Vc9HYR5g=;
        b=QztTeJN/sUyI5G6rca16zgMRtWmXh1j0lAl3PAQXsfq+N81nSTRfNBJN/sl4i47aby
         3KUVCqxZCJRhe+ZLKkG3KB0VKr+gIhd5qCKg5BCeA9S6WatISzgyfc8QVHpRRWGQZsCa
         KKRtuC881aiET1CFPOBIPNdMQMAeP91q4IXkpdvhuL8HbLJc4Cs7D3BIvZKUtzA//38t
         VDIR7nR0oQOx4xYbrvNXXVKOLJ7CNn25C7BMQTHwcHnKqbGkrIrTmeOjWLahuj7Uv/DB
         aDWcW8P1Q0DzjBME7T6g5zW/mG/Sw8stenHsTovbYHvBQ9EMeoaMxuMCheqg8ybD9hM2
         GOZw==
X-Forwarded-Encrypted: i=1; AKwUvBxLx9LUJhiQ/+6HtaumavQVuYid4xgpIbvGmMQZ5h7R6FD7bn88Ur2++UUdqaYCDoM+LtkcFt8N5kk=@vger.kernel.org
X-Gm-Message-State: AFuF++mTG83QEJv8TubLh3GvmNkaCtpN0KhRW3WNPBIxDRDqyGPQ9SMr
	nU6YKlRavjuME6SfIkUFPfzk9feZNSdOaE2l8x6QQSEBIo6mxF/ktq3f
X-Gm-Gg: AYBFou234kppOZDhttzomZaBDa/lc4+P5FlsMDyA4hQIE5imKiXKtDwY814F44J375t
	CtQg3HAIGOBVd2Cw4+JycAbCTVr+EgzQo8pzgsRoVcUEqcgldcLtS32fJPRxtF75u/tKas9tjvs
	kh63+EN4jiFr+sGVYsIT9T0mwjxzlcQ48ymOQ2sYqm1sVdfkmNgQAT27rUwoO02gXAkRpJA25fn
	h/fCOPVwfFrRBxXA7rQm6Vt2PuwsTGOcy3OfX83oxl5qc1EewPo9n14M6UOdfk9qrMG/OLNqGnU
	flXEky0znlECQA3YZgQAuYm4sigmWhx2vo6vsZy+lC2wcVc+YclIXQJkPGtVPIQVIypR5eGl7fz
	u13a6ESUJBQttf3ETIj6bFHDaVtUj7djSrgPvi1avSByopKGw13aM2Ujdlc1VTCfOwEiN1Pz+El
	fXqJqz9w2TCz/uYbhx7muYLRoEXusZNxjpqfHgMtUB9WNl7ZIRiYvvv8ytPpC30f+2drDTng==
X-Received: by 2002:a05:6512:2586:b0:5b5:56b8:2fba with SMTP id 2adb3069b0e04-5b5e6902ee2mr8478958e87.21.1788188324305;
        Mon, 31 Aug 2026 07:58:44 -0700 (PDT)
Received: from archlinux ([94.229.16.221])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a0ce86sm2227956e87.62.2026.08.31.07.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:58:42 -0700 (PDT)
Date: Mon, 31 Aug 2026 17:58:39 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Zongmin Zhou <min_halo@163.com>
Cc: gregkh@linuxfoundation.org, kees@kernel.org, david-b@pacbell.net,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] usb: host: sl811_cs: fix memory leak on probe failure
Message-ID: <apWWnyGbVFJ8SbiG@archlinux>
References: <20260827074120.49006-1-min_halo@163.com>
 <apHG0Pq3HagSo5BT@archlinux>
 <a4e969d7-4601-407e-a4ee-beb85846d711@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4e969d7-4601-407e-a4ee-beb85846d711@163.com>

On Mon, Aug 31, 2026 at 02:11:16PM +0800, Zongmin Zhou wrote:
> 
> 在 2026/8/29 01:36, Nikolay Kulikov 写道:
> > On Thu, Aug 27, 2026 at 03:41:20PM +0800, Zongmin Zhou wrote:
> > > From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> > > 
> > > sl811_cs_probe() leaks the local_info_t allocated into link->priv when
> > > sl811_cs_config() fails: the only kfree() lives in the remove callback
> > > sl811_cs_detach(), which the PCMCIA core never calls for a device whose
> > > probe failed.
> > > 
> > > Free the private data when sl811_cs_config() fails.
> > > 
> > > Fixes: c6de2b64eb57 ("[PATCH] USB: add sl811_cs support")
> > The code looks good to me, but I have a question regarding the Fixes
> > tag.
> > 
> > In the commit you cited, a failure triggered a call to
> > sl811_cs_detach(), which freed that memory. However, that behavior was
> > changed in commit
> > 
> > f8cfa618dccb ("[PATCH] pcmcia: unify attach, EVENT_CARD_INSERTION handlers into one probe callback")
> > 
> > where the call was removed, leaving the memory unfreed. Shouldn't that
> > be the commit referenced in the Fixes?
> Hi Nikolay,
> 
> You're right that c6de2b64eb57 did not introduce the leak -- but neither did
> f8cfa618dccb.
> The leak was introduced by 15b99ac17295 ("[PATCH] pcmcia: add return value
> to _config() functions")
> 
> f8cfa618dccb dropped the detach-on-failure path because registration
> moved into the core, and its probe ended with
>     sl811_cs_config(link);
>     return 0;
> A config failure was never propagated, so probe() always succeeded
> after the allocation and it remained paired with the kfree() in
> remove(). No leak either.
> 
> 15b99ac17295 made sl811_cs_config() return -ENODEV and the probe return
> that value -- the first time probe could fail after the allocation.
> Since the core never calls ->remove() for a failed probe, link->priv
> leaked from then on.
> 
> If you agree, I'll send a v2 with
>     Fixes: 15b99ac17295 ("[PATCH] pcmcia: add return value to _config()
> functions")

Yes, it really should be 15b99ac17295.
In v2, you can add my

Reviewed-by: Nikolay Kulikov <nikolayof23@gmail.com>

> 
> Thanks,
> Zongmin
> > 
> > 
> > Thanks,
> > Nikolay
> 
> 
