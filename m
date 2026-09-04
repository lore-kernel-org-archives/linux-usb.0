Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26CC175A6B
	for <linux-usb@vger.kernel.org>; Fri,  4 Sep 2026 00:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788480837; cv=pass; b=pZVRSjmYZdAlmSZTUUnsnCN5aRN8n5S1U7VC/6kovCP31SON6309WGBATgsku2KB2K73J9xQ6YzxOw426yELenwKKvuSyS7n0iXpTEDBky/j2JlDjJQl6Vm6yvL62kZ82gDq4sMLWmtNqx6fbzmHVY4RGGlinOyJQi+D1rMuw2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788480837; c=relaxed/simple;
	bh=k1vm0wD+WAoF/PPCZ9HxXPrHQPCyct41OUeaTmCwYts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLLepiZAEsMoJbh/dCMUU8s4hCTdazPq6sIGZtP9yW9W7bPBSmxGSuuypqsTvbw71RWd834qo9i3kiodRGzyXP1FQUTAuw3LV2EbhNHKfXRqQg2Z0F9u/uFReBcS4cLa28NodYIISn4KK+cfeaaB4zDEBcES9B7/nhMoQdcdO50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DC1UkgLr; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DC1UkgLr"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so434926f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2026 17:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788480834; cv=none;
        d=google.com; s=arc-20260327;
        b=GdkAsOtCoQbAljPD7ZyIzokNhAvFxldO+i1JolTMxDl5cb29amzbvn9+Yjxis2HF1Q
         a3J/kpNNp6+6emmBvSfJI3rfXHA4yyVnTYsMe6HEIeyKmvnNHZIJI7T3+05w0Ofy6bh0
         j4cKpwJ2pGO6PqPHhWIbuGBNeDW4cBvFmaUB9DvwEGt72H9zvhR3eOZHcQ7XlfE11s7g
         5CmIYLocRn140SofnCHwCbt5pp634nHOVPiiqwDsazTSNHt2k58ZDuOyIqVALlBVrWb8
         ByC1sud2yGPOA9gJ4mhYsHUGBbiRyPcl+u8CGboeWy6oLU67W9MDZhFAYQQqNKd96gur
         zhXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=k1vm0wD+WAoF/PPCZ9HxXPrHQPCyct41OUeaTmCwYts=;
        fh=5sgU8oIq6p6TfCmxaJXXPDOAgvyGh9c1T+KzMo6efLg=;
        b=lTPu76g0NFg32fJho6Ldc8tdyw6gE03JZzpnUCacgL0TqVN6D4tRWuhnrdL6fT4mZO
         bgQyMSL5t8devBMr2f0E3kkAjs5DGdIlnVRxz6Vx6LQXEkgk8O6mDF8dkgiMC4eE153g
         DI1fhD6CM36uAwEgYvnoiy3Zt4xXoJo8T4dBIXvckkROADkV2mUmZKtCKLHm54Fpscgu
         L9zvW+hq1CUyvij8z0aPQDVdnVqopnYOVUd3gamuqf1A2EpP9nHEXwo2vb7HvXjJMB50
         d3ezAudeSEjV1si10e/98aITvhQwzLM4zTWwaTncE+I9mXR2SVCWgxe/j2thlYncZS1Y
         UAwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788480834; x=1789085634; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1vm0wD+WAoF/PPCZ9HxXPrHQPCyct41OUeaTmCwYts=;
        b=DC1UkgLr+71+wuXvfiosJgSfoGNIQ0EzEugTdQ1R8C4F3bQPQtrx5+RPz/bzMNMF36
         B6gQtLw8V+CRvLt1uCKCeIfqSSEveUAtM4xsUZALGbHA+TK2ihImq0Yqny0Wt4esS0f1
         0voi574SiUC3t+bQofIMzapspOTUTUjYBMXE79kTGLjozkjYMvigLGdCca6uw7UVHHV+
         CuE5BkLg1UMEu/8LIuREWl9ht+hXV3bCjg3+r6+rGXl+lfjJPxgXqOdaPKelzpvnd7rc
         IJ6I2ei+cszch6QTgAeA+RavUr5ip4YbanQcxm3z14X74TcZdCkfcQOIePj18ynu8vtw
         JBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788480834; x=1789085634;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k1vm0wD+WAoF/PPCZ9HxXPrHQPCyct41OUeaTmCwYts=;
        b=iKcT86RZC8XhHH4eloFpxkrFfJVD/vjha9AMV7h5mIvcs07lG97HMkyTF5ivcAlOoQ
         zDr3VkU9WGzhH5Fgq7Hron4kg0Pj2GJQtevzb1+YZGC/YTrmSAXtlTChNu0TWf5ZCLYJ
         gXfnLTgT5e+8367euwMRxB4N7DkFBgX+ONb66XWBaJTEE9fmfXj/X9v5OM+LoJ+FYZqw
         o+TwvluRYHGHfcF4MaR9asuzmlvHRrHLOBQaSq+/paQE9XzTK8UhctpUvnqEb03lrqWp
         d4RowZtr9IwWq5RQna5nb3Jnb09Lxa8dLo8o8czfv/ijsLkzA820L3iBwieIT0/b1LbB
         WP5g==
X-Forwarded-Encrypted: i=1; AKwUvBxOu+RgTmSyWUDvbndrhoTo1zB3Z5t5UiD7XGxKsJ18VuGjGU9hudDkyEBqESLQjsxP57Gk4YyTz/U=@vger.kernel.org
X-Gm-Message-State: AFuF++k6u7cIulHrZqKtDEOLrNnWeP1LBDrDivKH2SOGtiW+qsdJnh34
	Ya0KS5E2LnIg7QGh1Ve4pk4UDarIVT3cQBSZ9KbKzIk16W1U4Nrxf940fs1h3txs2ogQTUMXjQL
	oV6ff36JwaxMgVki99Krf/SuH9KmUCtp7o7CvLZ3H
X-Gm-Gg: AYBFou2V8sjc5ca5dsqRwuTtpxWD+HL0SbzOnLnmXSPsvYcsTGBxcFQtlyW/b57ADCr
	vUvey1bbek2ykwZNPJ90nqEkF19HCE8unfPPsQyhHeBjnbKxVTB+8U/AVetFBr3JdkVYRtPh05u
	EQ99hqpeG7TICrJAq0paOg0sZOHZ21XmKc87cOh8powVVPRrB0zWmtvASmsGR/+LCaq/N6jC70r
	vHJ/Qjn4i7zld6ki/el40Kazf4hefK/CWaPrFrlRhw2POz2kpkbGAT9wzuqIgGs4+rzLc4Cr0+H
	xC6No8OTAP8doe/QCk+zUUSrjEs2dfjFOEBLECHzpCbuuy7PuwDh5AqsDbMVWvIsA0kVYdvyQwU
	=
X-Received: by 2002:a05:6000:4694:b0:47f:9266:9bde with SMTP id
 ffacd0b85a97d-4858703f92dmr4163408f8f.4.1788480833517; Thu, 03 Sep 2026
 17:13:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260818205717.1492247-1-jthies@google.com> <20260828100120.139648-1-marco.crivellari@suse.com>
In-Reply-To: <20260828100120.139648-1-marco.crivellari@suse.com>
From: Jameson Thies <jthies@google.com>
Date: Thu, 3 Sep 2026 17:13:41 -0700
X-Gm-Features: AcwNN1Wk6O2yEsLoan2NVGDK0Tv_I8WyUzGKtzunFIJmpV5caiOTAh0Fu5dyStQ
Message-ID: <CAMFSARdUrE1dE=OkQbU9++qfYTUoC4QUSxdqKWFOPj_fqDKoHg@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: ucsi: allow retries of ucsi_resume_work
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: abhishekpandit@chromium.org, akuchynski@chromium.org, bleung@chromium.org, 
	dmitry.baryshkov@oss.qualcomm.com, gregkh@linuxfoundation.org, 
	heikki.krogerus@linux.intel.com, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marco, thank you for taking a look at this patch.

> system_long_wq is scheduled for removal.

I'll post a v2 switching to system_dfl_long_wq.

- Jameson
