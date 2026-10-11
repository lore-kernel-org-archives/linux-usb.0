Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 496C13EB104
	for <linux-usb@vger.kernel.org>; Sun, 11 Oct 2026 06:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791701819; cv=none; b=fxrRWzUor0MxbeHL5hT2ol9emXEszi3FP7oE9c5uVvmPQdYZ27mx+HGvOvgP7cLujl4cTQOzEFIpxgSoO7OdTjCKYFIJjRl9ws94f/hdME9slNnZ4S8eETfuo9MAcSpjVXYeGtPPClDS4YFI742J7ixv5tcnL5TIjM/PeRKScXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791701819; c=relaxed/simple;
	bh=mS5lX8fFZA1W53rHD/knA2txzovPkZmDhLKWmPwConE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZvVhbYGU7kXwWaU87mdX1FS76eOBuUp8Em3MKVRuEQZA7AsbC+FwtTseM6tYwc+5fXEuAbxjctbYI5exlZbXZnVxFHIsGTkLYrIeJoJZlVXM16Tb61aUE7LMReJikb0Ene1AHrdNVZ7aOz1s9bnU7zYy/qz/m+7hgOSW9M0QQrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lX2iTk36; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lX2iTk36"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso12342925e9.0
        for <linux-usb@vger.kernel.org>; Sat, 10 Oct 2026 23:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791701816; x=1792306616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mS5lX8fFZA1W53rHD/knA2txzovPkZmDhLKWmPwConE=;
        b=lX2iTk36r+Jn5cI0FtJ8Nq40yPRLLGntR4Fe4fkOubNsc/ehGWNf57hGAn3YLMj67L
         qgn82J8eiqQf3heV3nC2JuEyjmEhaRBh1ufIF0JBe9aGuTQPe5V4xrqmk5eEPa3dgB5h
         /FTOTuq9u+Ue7A7fQ2QKDfhXRrbZljKLN5XF8p2Fesu6dxysDuWCCpD8twlLHJEleFo+
         PChXKlhE4CCientVZlWL3bQdkLtkhnMgNMKeJQr5Za7L+2tD6s2eK+q/1fuJrKOGzjpd
         G0ObxJDMso+pGwso6mblNFpbS1ZiVOKwmMRY01woux04vwt3c9+bhzBi/QHaoOD2DYsU
         hCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791701816; x=1792306616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mS5lX8fFZA1W53rHD/knA2txzovPkZmDhLKWmPwConE=;
        b=tg8B+SMh8VFISlICHTtbx026/YXwpd6MZikKKdw6XDdi+AyNmefS9DYHdEICiHOWCR
         RiObxZToMQiap+8INZE8nx/2JuojOuD+3XJYX8DL4kulFT9VcrqLf38vnVugzJ/bsBUM
         50gZuUMuwCyF+YLB6C6AzgtQqPXbscCnIjfc7TTnDjHx1gXmGZKa6KyYtqTSx5c98KoL
         kn8a7mS0xTBVGFBeGGuXur+veGaVs0VIrJGO86L5ENokAOV15amrYCbdJvZvolpvbLuR
         reuknBvazX67wgEEr5JIQ2n7H5ZIzk9QWByPdY5Z+YcQI2Us7CDn4F76UDs6+niC590d
         H55w==
X-Gm-Message-State: AFq9FYLRzL7YOirL2wUXnqQx7TupW6F3/pKY0TS/I6VJjfuBEYGY6HSf
	4d455XVO/6OuUk3bRI4YjqTlsHpCKpXAizNFc7NNFFrwSFv6p6DsYO4tpirEY5ApBm8=
X-Gm-Gg: AYBFou2Y0d1tUYhsYZn10nVM5q5ZJbAR6c/RkT7iCKwHMK6xcpic29vfc4MFfQCjhsS
	0QmHVT+mb/AOIVDfZy8eumXMUV9HwHqNR/mc7npSGykfvII+DCJH++YIm4kBQ08PqE/0/M8PO+i
	Nn0rQx/KlnzuZJs8zBbwIuT527fybEWaZ9cziblGWzfZSeCENUBcsXdzVasutsdWoeooMZU8Inw
	wJcga360xyGs+kr8rhQ2bgQaYsM3kShwYRJE6u/kMWu6JKaDAJ+c9N8XQ1p353grGxhv5aHLjRy
	FDpq8yDJRjybDyxa0VX149Ah1NaoxRTyg2AtsT3Pmd+FbkiXOBLqUBBEIMlHV+okhZiVCgZ2WB7
	nYIpAQMHP2LLqOT/I56oIk62S0Kjm0n7uMilAL+xB+LjFqnupUu+RPdnsvS4JZ+B1ZE0O/benWW
	9f2cSAu/+1IgL7BJyGWWyvc/emveiZyh0h2Le6AutTLTG9OCUBoKypfYkL8n6bX6G+mOZGNpmGX
	17DYcdir9gokYz9MoRsyCxTvjRkytqObWYjRkTxlkwT/PZkprxaw51IGRCSFcR2Wb6YVUVGYiel
	KbuJXCIF650y8dGH
X-Received: by 2002:a05:600c:3e0b:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a18e4b1311mr110609645e9.17.1791701816232;
        Sat, 10 Oct 2026 23:56:56 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1900a5e17sm62584695e9.3.2026.10.10.23.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:56:55 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: octeon-hcd: release the USB block when initialization fails
Date: Sun, 11 Oct 2026 06:56:53 +0000
Message-ID: <20261011065653.2374089-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917072144.438023-1-orgads@gmail.com>
References: <20260917072144.438023-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

A gentle ping on this one. It fixes 22bce6d2b3fd ("usb: octeon-hcd: fail
the probe when the USB core does not respond"), which is already in
mainline: when the core does not respond, the new error path leaves the
USB clock enabled and the PHY out of reset.

If it looks fine, could it go to Linus through usb-linus, next to the
commit it fixes? If you would like anything changed, I will respin.

Thanks,
Orgad
