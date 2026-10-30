Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793369027;
	b=BMYyb2RfPdoBLIAAu/l5nXaWKJZ/xQD38dlS+5+q8pfGZ/5WX25QIp/opbVp2LhMrtv9
	 c8TCgP2XGPSbq51YF2a/ouRI/hv32nytuQT1mbQiTLIgcU6zS8jkTXcqvY0QcsW4iMym3
	 zwDXoSKts57b49gQO5IErgmWlGTdDTEXLR7oVBiIPaWMuOBlPHbnmgSR8NlqicAWh2ecN
	 RqaauTzdrmnXHlKuHAgK7i0LpaDJxqh3U2S2eZzVlDOcQDZzmQXuL18p1A1KjDV83Ok6S
	 5vLXyzRj9uHPBYMmYnmH8NOIaw/Fjm0t5UFVao0FT0wB7zKh0LaoJcgbe1vXpFWjx5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793369027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RNi/YV07iESSp5HzRPxOu8kqkEJ5qhQDfYYkAe+T8VA=;
	b=TvaXTu8QBqUvcMWfsLv32EzT/9cqsll6IeUqLnFi00aOU08PDTFsgUYX3oL38vCVZCYc
	 WjKJTv8S1CsafKr/efYDgaQdMJJe5ZiJe3limVbfNcOEEzCQ4F+kfCA4aGnyOriohHzoW
	 /LCwWcXLDZ7FhXeXoUhu/rybxMcV1uaigHp4FzV3Xju8vXDe2814ctwwrZTFAoMnK/2RJ
	 TizrHXZJNGbsElHu6IdFGyAVG11kLJ6yfEx1IFj1yiMUbYZfMF44ru/PTAoGRCPgB+oeh
	 gMi8FjW9NP5f12F2QZ45zZth7lC9y6LCtpTIXZF8s8eubOd/O002jBzMzhJMS5begnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=efYy8ccY;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B959606A31E
	for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 14:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B959606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=efYy8ccY
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd69954c755so531392a12.3
        for <linux-usb@vger.kernel.org>; Fri, 30 Oct 2026 07:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1793369027; x=1793973827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNi/YV07iESSp5HzRPxOu8kqkEJ5qhQDfYYkAe+T8VA=;
        b=efYy8ccYHATE2WA0wZRSaVlN8TOl1bJEJ/pwwKfOu7DOOKWLhFAfasds2OCArHT+Id
         84hoQgBBMImfH+kgaJN7XBxMxUbJ/yLWe3W+SogXWdXvJP6oLcEOVQCJqfDcIPqXS9gl
         QvpoaRu0KxaKcux8E+xlqIt37lfVM0gjjntcZ0uIrOJRLUOywSYqBQo4mKh66qmIAo7D
         Clnl2+00funikVLTNchh065sDyi9fuLOw80s+ibNFzdoLsIWKUgJj5J9m4yUEWxYNbVR
         srKt6BY1prlXhzgsO30teQwzpNf1yJc87KqdhVRT+vaqvzhD2OhMIWEpq35Q8ohNpm+y
         4YaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369027; x=1793973827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNi/YV07iESSp5HzRPxOu8kqkEJ5qhQDfYYkAe+T8VA=;
        b=ukJhSKQs4bvtEawguMRc77x5gm9GMMBUYlGQO+pa0q8RTacg61L3FHZ2GCTlHSG9rU
         GjeLVkH0IvQJr2Er0KaHeQ2UP9AN2/y2GOoyl9jD0mYFD7vKJJ2KTr5MRBM6DJ++XcUo
         rSD01EFKZFuksl4JI9C+S/zqpovkvqtORH2zoly83w/8J6egPBmk6zC2lkVVgNUPt5yv
         7wdVKsvlc+3XpQtkQFkaWvDabC0jFCS0x1Y1nE/jV+U43168dcrEYMGOj1ajGFXVPjRW
         1o6IvLc8KZU+ozDb8gjyUA5BocPI8GBLLKOfd6WgLyWkQB/OLhKBFHZMcFMdU0ZB0VjO
         FtKA==
X-Forwarded-Encrypted: i=1; AKwUvBxz6tZ6aMshJc34dOFratwGFgXJoFT2HKsFk0GApClsp85CBlkbs8yAekXUCW9lUJ9nqaOEkBn0BXc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI83QIZrfDctts0wdXzvXAy3sETwGfp20CESHt32HCclQm3n8gW
	oSyRq6LoRVDwMkokQgG2wOZl5XoaVs0sJMxBSRJfWpBPO6Qe/b5bcAKKEj7nMh16m6neFbKyA8f
	2u/wXHRrX
X-Gm-Gg: AYBFou3RQquBciPIsIdNcVw7ZLlqiu/d+NQDlA/HTOzi/VfE+uaVYwjac9iwswg5gSQ
	OcLSCXAAeauseG06Y3OC+VmdSpClFQNS/+aozFs1zCXebTmazropFvM4Ke1/1iPo20svH87r9Kg
	Pq8cs0ltxuOhaix0dOxvXvd6SX3tPnSkX7SpJ2vzyfwzEJqQ1NzLOEdmVyoG2xy3LMV/GKMvXXS
	SEbVimOLlqzw4XkzoNAlsojQOO8kjvafKzBxWtGntrrayL8Rso8gtzMGa1+3UuHgzyW6fxkGexk
	70qgKEfrrBzPKeWmYIwlyD1TUuvOeZ9PgXSVUCI8XWx0HMLAsEpjfVnR1IPSDEl9DeLLs9NCqZ7
	Z3u0FMFDNNRkJvyHMelJ1uPUhLzfY1glvY8LP6CsRpm7AVSOR69Xueat576/lc/IIlS/F3ECK21
	Sw0qMYQ9fSUioANnxS36TFgzapUnutuVNFJgrwPIfIxRM4HCEYpS/6THs+a4ca6S5n2K7bPMN7H
	9ngEDKvcuKiyjaGgl7IX+RUoK94qQhzrEPaOkARU0OeKW5BMfpgwZPJLuu7Pttx6n2cYlA7ILHz
	VLiOixVA0WyeYnmO8NygIduoU5YlI6yHwlfIKOxrVsrPna8Spu99TpEESwQYatbVgkfiAGTmRK/
	h9hmzaWjA1dcVV8oz
X-Received: by 2002:a17:90b:1b02:b0:3ad:8769:8741 with SMTP id 98e67ed59e1d1-3ae8957453dmr1915084a91.4.1793369026593;
        Fri, 30 Oct 2026 07:03:46 -0700 (PDT)
Received: from cantal.lan ([58.136.77.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85f3e087sm2002137a91.1.2026.10.30.07.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:03:45 -0700 (PDT)
From: James Clark <jjc@jclark.com>
To: Johan Hovold <johan@kernel.org>
Cc: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Ravi Chandra Sadineni <ravisadineni@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] usb: misc: onboard_usb_dev: don't defer the USB device probe
Date: Fri, 30 Oct 2026 21:03:40 +0700
Message-ID: <20261030140340.3383998-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <auSdA8MfolA8OhdM@hovoldconsulting.com>
References: <20261030114705.3159093-1-jjc@jclark.com> <auSdA8MfolA8OhdM@hovoldconsulting.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 30 Oct 2026 14:34:59 +0100, Johan Hovold wrote:
> I guess you can look into replacing generic_subclass with having the
> onboard_usb_dev driver call usb_generic_driver_probe() itself or
> possibly adding a pre-probe callback to usb_device_driver.

Thanks for the suggestions. It looks to me like your pre-probe callback
idea will give the cleanest fix. I will try that for v2.

James
