Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADAD584946
	for <linux-usb@vger.kernel.org>; Wed,  9 Sep 2026 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965922; cv=none; b=TjARsbMFHCPOYrMPUE5PhV2WdPjPKcuZnkmJBold/ZQ1CSGZK+6SmnI9vzBsXWPHdxwELNPfofzLltB4GrOfAijyCUxXDMqY4pQGo0JI602Hvq/nSR/AaOu8Ch4XU38cgvkfdDklxNITmzwJveMIi270deLeiFihGshp9i/aPCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965922; c=relaxed/simple;
	bh=OG8rM47+wQa5telCcXnv0ivoaCzuHrNel/g8JAXQwo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLx0CEGgy12uDEUq28a+rmVm3HD4Ees0WJ/dKMzlmAvsPuKq9AfkdiDFj3Wd+l1k9fh8/p9ALfGoxv5SKauxfQiZyjQ3296B5dLX7DPoL+pw5dsYWH2o9DSZhESmmN/Z5NkPevCOyHnhmtkqthM1/p3szbDfkIOpYQrVsLLv2Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gcrX/Osr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gcrX/Osr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso2905435e9.3
        for <linux-usb@vger.kernel.org>; Wed, 09 Sep 2026 07:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965917; x=1789570717; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OG8rM47+wQa5telCcXnv0ivoaCzuHrNel/g8JAXQwo0=;
        b=gcrX/Osr7jULvPpbVsiR/YE9EUyFW21uf4qekP/mL8NCiWrT1G2PD6OTMxmnXIrSka
         zqfBu5VH68FGtu7lDQVTDlvArzM+4iBhQ5nocWDOLp7d4KKrDA67U+PjVqCsFPgU+7DZ
         ZKE0IKelzKPx5DmCzVdVlSMBGfvaT2ywShlnxBvYgzaZiNssuHexjXI5QPVZDugjDpac
         hYRskKl/Htp256c7oZMUlEvnNlloEPSRqZbz0N7Ja+UgV7SxwsaK9XS9g/kRKaacRT5h
         nJmuTTSDM15tsAc2Yk+K1Vy8KAtovzExAWL1uYxt4Vms3KMrckO0QgYfPM4ni+OzpLVc
         8VNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965917; x=1789570717;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OG8rM47+wQa5telCcXnv0ivoaCzuHrNel/g8JAXQwo0=;
        b=RHD0pryHM4+Z5QhSqZ1ocnifzQBjnp1pzras+WkgWXfcT/2I1ZEITs9JGqZ0sGyjD0
         Blh2Isd1hVL6ztDhvL4AU8s9ZRFUG3MyAaJegGzYkn1mp2VCJOiLhhoc2yM1rcpNdyf0
         TPOh9e+Obs9RssxwQlBvu6WDu5DLNCifYSmHKqjcepEeiltdc3fIpFs5qAQC7gsUL0DJ
         Oak1FhF76afFm+QfMBy38U1eMInUBfJMWCx3e8Wtqt2b8qeqSlyvH5ekR1UyGL8TAQf9
         l5fseOS5LzPOCluEFUoL8d6UCaXKVRPOXlznz8zmLp/8e4Kc6DV9mssQhkfbVLwpZE0H
         AfUw==
X-Forwarded-Encrypted: i=1; AKwUvBz4dw8e51EpcqoMsM4VEp/P0scBKJ6tKXK53bn+hqHuJV6YhNEKn4jNyO8RuFDWM4r3YMTWLJF0RGw=@vger.kernel.org
X-Gm-Message-State: AFuF++n+zremVP5ZEIKNFtCP8XbpnOSrpOXCCuuMAeNbH4jfodTrXx3/
	ZQpY0OfWxa+6CNKIwr1MOxEtxVzcwuwA+zp3FrV95+YOKorlFeQlyf5xbEAenzUDJA194Q==
X-Gm-Gg: AYBFou2/Lph4XismyiWHrBa0YkylVjlM828i2zUi72kmfhrbb5loZjUhFyHd7F0Vw8z
	NvH/2HHBRKYz6eMgMJoZz13hoeoNa4zMW6YcLQI9+VmKtoNkVGzBL0ufV4376r298REUUIsn/RP
	gE+N16Ob2x2xAoqXArLDqEVu43PVW/BjrHDeKR2LvSVvcYM5ucjVjVziY7MepA3+CQp/OmN861M
	c1EXfJBioviq3NOezWcNvspXkPTo3qpYnPZuO53wKEbo3CzSH598yXQdD/jwCBZAYkuoJ24/Ox7
	wKoq77c4IiX7vL8i2wp5jWrVEBuHymyJIroiubbeMteYFjjUvnxqYHBW3mb3Z9oICXtT6tKw3Na
	YB2ohcE7EXjtVv0+xnG8HFoKWtYNGomv/XxqlcqAfYJqgeAV3qivwgPv3DCZNpdUq+AVMMpPMRS
	8VC6NatsBJes9nYK3FloYak3KY+3S09aKI2Lz8nQNyorjemMMSCiAfz5mHfPzsWdo1WZbkxf4m4
	9vJ3Q==
X-Received: by 2002:a05:600c:8b88:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49d2593842emr34218375e9.14.1788965916931;
        Wed, 09 Sep 2026 07:58:36 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm423987255e9.2.2026.09.09.07.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:58:36 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:58:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: gregkh@linuxfoundation.org, torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org, arnd@arndb.de,
	linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v9 1/3] interconnect: mediatek: fix Makefile typo for
 mt8196
Message-ID: <aqF0GLDB5a-P-uvq@stanley.mountain>
References: <20260905130925.7115-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905130925.7115-1-breno3011alves@gmail.com>

What changed between versions?

staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

