Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99DC45D5D0
	for <linux-usb@vger.kernel.org>; Wed,  5 Aug 2026 14:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785940708; cv=none; b=Uehjvhm5HIeEDFZMX3vT3OK5qYLL9Jb7QUMsajY4C8atGd0LKJMOP8DrCEcSt+ykE2mWctEYE/0VHSEnV9bcO+cEW/fMuYSffkFSjFMLiW+TeEpTuMm9NqN/EmEEtE7uiy3b+aYgZCgbPVsMNOOkxDugg//zJAJQgwJfN1agwaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785940708; c=relaxed/simple;
	bh=btSnk9M580UYnOIBUdL6XgXSt4VZJsBcyldHAqCQRu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dR4oG6TSFFyI8RPthXJZXD9uxAUKPcTCxT5m1aBhXWNV1w06x8nK749X4m//tUb7KHQ9LtD3UDXbotQlV2nUIy4mFu/4LV1p/zqYysPz5ubxPt+feGHa7WaRFjS/+ZDun4Rko9wANXm4SkKcvPXSinR5wL2ounhMPcTtNxdgZSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gTnVOfyC; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTnVOfyC"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aebd52488cso1273117e87.2
        for <linux-usb@vger.kernel.org>; Wed, 05 Aug 2026 07:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785940703; x=1786545503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btSnk9M580UYnOIBUdL6XgXSt4VZJsBcyldHAqCQRu8=;
        b=gTnVOfyCDB6xEdH/pRHi5PoxpusnbNjLc8XJGlMdkYZ+T4LElFeksmHeSC2niCfxdI
         g/m9u992Mg/wjoEISCi9fuToLVwxwdDssxc9gKif0rEagS6sTd5UE1G/DarfayG50uHa
         x2S8cRzjArfP7JkwHzC14OefUbrALkQ7YTAqL3+1Nmq3RG2rJO3OWNjlqJ56oZ4DYMz2
         ma5G0IoR160QogUYXo4Pth4dHCNsTdWVcsX+xesEmbzKGGIk6X5n9H8HL+dfKjfC74Ez
         ITcD03XWJ5j/dSSGv3rcJrfZcVVejBncGbGPy4QRlz08YZpQhpKu9SbjNPbZ/PRUCCC/
         yckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785940703; x=1786545503;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btSnk9M580UYnOIBUdL6XgXSt4VZJsBcyldHAqCQRu8=;
        b=oWwaDxIFN6yVimtI3SfmWLpgnr4lHoWDy0CFd31EGuHRYjpS+JMIgAUtXP4gEMXl7l
         Kc07GMRfzp7YHtZFKVvvJVTvmBJyJXlmeLmBM/Hz/m5xRsSD+I7EOzz11HLuNo6wi/ic
         Z81MpcH496tFzdWaVXELakb+KeFhtuUzZ0PESBFHpbJ2Y22SmA//XOV0VtTbrdPYgzF1
         kjtAIqJOhfgn1XBOW3UoxEq3seQHQQcl9aHaUjI7TM8G0dOzre3U3NAwfnhzhwLjzn+A
         oAosE8jXEHKZmjE7dS5PQBG3XA8HxQITSxKZI6rtH8TCV9B5m3uYHNamPy6VKKQgngYj
         /Ebg==
X-Forwarded-Encrypted: i=1; AHgh+RpH0kLvLaCKxIIUZDpv1tAikQTsaKBweY9gOouRXW+O9QAWIGrMBcneN1mRchF6phuV7f1XR2Uyvrs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpF5YhXnwxaCzao/4MOitbNeW/3U2+OKrQJjDMOArtNX8AlscL
	NqUVkJ+WE1HPWaG9NuEh5oVnCL4h38zj9FzDMHV6P7dySxprjPtyA+6LrQKadw==
X-Gm-Gg: AR+sD13wjs1lekzpJPRpHUWhqC2/g3DXUeQyPeIuqYs13WEtByASn9iyxmFLxRkvrFC
	V0Dkc5yvayNBoZPBzDFq1GnSXK1xAx3RYmTyGwrLjHiJ4QCG38GKZLo/rxGuH7KXodVJJdbfZjz
	lDtT2s3e5AdjntYvFVcCeB2Xe9pbGb/Lpk1Tw1keQPEH5m8M6zPJImjHbwc5PlYP1FLt9x/ByFP
	4zGjwfaNTe4Y/oYPAZty32dLUvXRor2Cn8x8NJaN/gFKGBhdJ8Pro0j588PoHuFcTFYbwqtKBZ4
	KjMqX7ojMN5tJTCX0aSzfHaO8tXSWglQWkTY72Z8Rt8iRicAJYEGgb3DWQghhigvCKDeQuOIjMz
	m44vzWOzum79Z8E/tp8LNJewLGpKiUqDcZgMu2jSyLAMBsAWflvJ0NnOaxRZPt5+MYWiuNdYNQf
	Y6veGf+O5Oi4PQlis5EHv87XxqM6EXfAl2wWoazGmSDP1ADRkjIBO/Mb8DgHCZy8Jnj41SsT1Ku
	EJIOQ3HuISaXXb1ta23EO99l2TTrrcHfg==
X-Received: by 2002:a05:6512:10d6:b0:5b2:a4bf:a6d2 with SMTP id 2adb3069b0e04-5b2f4cbfb38mr1220686e87.39.1785940702654;
        Wed, 05 Aug 2026 07:38:22 -0700 (PDT)
Received: from localhost (79-139-241-61.dynamic.spd-mgts.ru. [79.139.241.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2f623d952sm178526e87.19.2026.08.05.07.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 07:38:22 -0700 (PDT)
Date: Wed, 5 Aug 2026 17:38:21 +0300
From: Fedor Pchelkin <boddah8794@gmail.com>
To: Huang Wei <huangwei@kylinos.cn>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Pooja Katiyar <pooja.katiyar@intel.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: typec: ucsi: use UCSI_TIMEOUT_MS for sync command
 completion
Message-ID: <anNKgfHTMT6osz9O@fedora>
References: <20260805085725.389761-1-huangwei@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805085725.389761-1-huangwei@kylinos.cn>

On Wed, 05. Aug 16:57, Huang Wei wrote:
> The synchronous command completion path in ucsi_sync_control_common()
> hardcodes a 5 second (5 * HZ) timeout when waiting for the PPM to signal
> command completion via ACPI notification. This value matched
> UCSI_TIMEOUT_MS when it was still 5000 ms, but it was not updated when
> that macro was later raised to 10000 ms to fix PPM reset timeouts.

Thanks, lgtm.

Reviewed-by: Fedor Pchelkin <boddah8794@gmail.com>
