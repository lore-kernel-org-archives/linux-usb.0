Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4ABA4B04B4
	for <linux-usb@vger.kernel.org>; Sat,  8 Aug 2026 23:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786230114; cv=none; b=LIz/LGf86Jwy9sFjcEnvmL2DKENFdfzBrD9zMwOZ4ykFqaGF4X5Xb9a2JaMRqwv/6+Yvk1qydYVyP5yaWobo1FQcA4GQzmYIEe/C/XyWXx2CPFhLjsOuS/hcj+6eS3hdOePIJFqUUxVKpxVrZF4EepUb9KTdm6HkQ7Rw/Nz0Ijo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786230114; c=relaxed/simple;
	bh=PbHjqG4bKhY0A+z/84eFe1TlUzBFi8QJP/XKCxzMTc0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=TsiA6NL8O766p/CZ5BZVFhPuRZHvscWkN5bKSwjnPDiA52XBDv6R9pL3WDGPnfGZlcwyorFaghXuhFZIdldKropCbnUGlWRiGE3kp0U56PVKC7zdk4dXdAp4pjHyr2tG5ZVOtDNgoxgAwwolVjEl/E4WkZkJJ5KWr1V/0x1f1QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Airnv4Bq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Airnv4Bq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cf27856f9cso7712405ad.2
        for <linux-usb@vger.kernel.org>; Sat, 08 Aug 2026 16:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786230113; x=1786834913; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PbHjqG4bKhY0A+z/84eFe1TlUzBFi8QJP/XKCxzMTc0=;
        b=Airnv4BqhVrZhxGQ/POgkqDdncGd7lJ9oPI0OcoZA+I4+3Hc81JmLb5ddidMRREwoM
         +l3d+uo9apX5k3pVgAPVCaNGIGoiFrcNfbCL8BCqJRdFGh82r0BkDrdWlblz7/ex+ccR
         YDbY+VqjlJLBWsdQppEhvLMoA55IeEeqfcihZQqLXkw/1TUiNDso7QiV8o1/mT7MpwpM
         Db27EIHvuMwq/mr+s8j7NJze2Ydq3yYI+u9KLqtWpXacHpVKHYpqIXk6N5awn61UxnuB
         SA3OMcm4lYSkCPerUgZnx+eyhUvpE+aq6vyTMfEwoDM6ydQnC9Aw2hrIDiEWdaW/sjpq
         K9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786230113; x=1786834913;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PbHjqG4bKhY0A+z/84eFe1TlUzBFi8QJP/XKCxzMTc0=;
        b=eU8z+3q2JWY5g4DdkxwKZZ0ioCGQThSb7R1nEzxthpojORBZZ7DHaYVQPld+vTclOw
         P5BW7LIeXgJ2AmiYdJeGWCJmSIEuyHCjxhLw65IBC+LuVV9xZSbPobWRcCrmvb489pzC
         wVwyovzLY1AtWHM6nZY9dZPYOVOBCtJv/7jbqjHk/vPltc/2OAIUQ2MUKK48HAwnx0wT
         G2LEeYBK3j8dfAEc8PYiGoe3cIkCv0fTJQc0ryadlrDUi9p5PbPHB/7qXJzE7NtgUaGa
         rssuzDQCkhMJmF0nt7IrXdda/ZZtRpPyDVWldakeOg1G/+ABifzr8odS1Sek2cIhst1H
         Xwhw==
X-Forwarded-Encrypted: i=1; AHgh+RpaspCv3mKwf8H/y+efr+Z364V/99xuYNT5istiU19oQWCA+HkNL/zYvggdfdhotu+Ylm4St9ZZH2I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJV8hmAw30Jxld2vDKt/qz1sDq/n5haPujRgthdsbndDghQ59i
	kEWoVvuY2+8AL+epRN6Cuirl6+4q+Y+0XUNRHBG/Ex7chNEajdp+VLeo
X-Gm-Gg: AR+sD10Unf6Sw43ber2DhzZRJjyor6sk/wuRm3YWIeIoXr8l17BEiNjv72dNKU3SdI+
	k+SKSCnZGXvcJ180STcaSL19296gjsO7b+z5QzF1H6VO9hFFK3Yk1TW7Rb3IXbqz5LxFZN29cs/
	jk9Q8i+GAF2QJMSnQyyaQUbrMZUpGArBG9gVgx0iYe/2YvxwW1bgpvOyk9HueiJLChB+P/spbv6
	1s1HqpogrMXx6xLUta4PKIVswYlpol7yWPzyc5Ou4l2w7Q3NcgWS7pOuZLa1bIg85BJlC0BqHIo
	gijV5wQDGLsqZgWC9eW2u9UBIIaVIhhMK0QQNhVtMPMM6ga3LetlA23YrqdaChGrvo7UPsc6UEH
	vwQy5W5nZ75yVqN9AWTPxNlQzwfY/zK4MFVucuep3M9BlN4xj4Yhz3qinOoyya2W6C8hzssp/Gb
	NntXLJ+Yh2Te38tErrNcaTQbC7+swfvYoR8XaIk920cGfCe5UQJPVi02mGCn5iEOVKgNcMbR7fJ
	VOAqtRD
X-Received: by 2002:a05:6a20:da1b:b0:3b4:9171:2573 with SMTP id adf61e73a8af0-3cb85ffd847mr41493454637.37.1786230113105;
        Sat, 08 Aug 2026 16:01:53 -0700 (PDT)
Received: from localhost ([2400:adc1:447:6d00:6351:4475:eeb9:18f1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb877b4sm27693935eec.19.2026.08.08.16.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 16:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 09 Aug 2026 04:01:40 +0500
Message-Id: <DKJXQ3WDXBQI.1S1F8T5NTG660@gmail.com>
Cc: "Mike Rapoport" <rppt@kernel.org>, <linux-usb@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] thunderbolt: debugfs: Replace get_zeroed_page() with
 kzalloc()
From: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>
To: "Mahad Ibrahim" <mahad.ibrahim.dev@gmail.com>, "Andreas Noever"
 <andreas.noever@gmail.com>, "Mika Westerberg" <westeri@kernel.org>,
 "Yehezkel Bernat" <YehezkelShB@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260808223829.3117-1-mahad.ibrahim.dev@gmail.com>
In-Reply-To: <20260808223829.3117-1-mahad.ibrahim.dev@gmail.com>

Some context I meant to include below the --- and accidentally forgot:

Mike Rapoport is running a broader effort to move allocations that do
not need struct page access off the page allocator. He does not seem to
be maintaining a tree for it, so landing this via your own tree would
be appreciated.

The buffer is kept at PAGE_SIZE to preserve the existing truncation
behaviour. If you would prefer it sized to the actual write instead,
I can send a v2.

Best regards,
Mahad Ibrahim
