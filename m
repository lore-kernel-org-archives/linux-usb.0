Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335925;
	b=sSi8foxnXZFoxFRPI96fenoAs1HcxabxUL2g1/3SvaVJb7m6t1HbG0g6l7zOHRcyMFes
	 1RWdIskuWSIR+UZHEXXyEs0YiEgmzGr5UeVZY/yc4y1bLxEqqbDgrZ6l5n2w6lPCpyco+
	 W43BzTyO8rMZRqUCTUzyNOYTdvhFLHvKmJdP21CTovYH11vndaZKs1se35C+OHiZBeD97
	 2dfrYVENWvXBt6pMaICUNDInUXcqPu2i9VypTUwSc7UnuysqGkajGhdIIe+yDx0lXVehA
	 c7BOu9pfNhQWFNSeGITWsAmcydENNEdo0IVBWuvbfotxFq3PcbGXuoaC1L06+1qKCbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=PHr5lMNgh4e1muETwY9dGYxImK1kdVOuIl14a1lxYrc=;
	b=EAyzkAqgE0mC706wVgUbveeb1bqWU5S/z/XgB44+++5P+U3jNrsaIoPj43Zp9ZBH43eT
	 9OJBSlQfmFUtH3tsgTSQbE/qDixm6zlLz85Ev1BdVRs6X/EIzs5XYx32geFPuOW0Lnw7G
	 vjRdGyaatOzmOEt1J30mPXAxSIgEVyHemR8Y0qIYIpG3Rvp0rrolZRlp8KkAEIB97g6r5
	 iWwrkEYxpP7E4ZuR0co5Nk80Ja/uoJDuv1xmgCuHJM7F968gHnnIChSn3Jv2aJsBQ1/Ec
	 ZXNv9yv6QmCrTlzmObVpjFWkJtslCJwpaqRbkfTb4wgkwlC5gPRuh0uS6c9klihjLmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OXWiRVYG;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C355606A32A
	for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 08:25:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C355606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OXWiRVYG
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso2463289a12.2
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 00:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335923; x=1795940723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHr5lMNgh4e1muETwY9dGYxImK1kdVOuIl14a1lxYrc=;
        b=OXWiRVYGiuGA5K4EINKm8QimzDFoI77PPgLGFz1wa8QIvfBbZwQ8BkSsar8q4DJZUG
         o9rionaxNbTyKqP2/JwxKcAwWs501r/puu15KyMlP5Pe19y1Z+cQpO7LAUh9t92YpDGz
         B5dwvUM8AgICmcMfyysnF846s3vs/lso8hu0mtnJPi1mZuvYSmNefiUj4TGxr0dGtxQU
         uzraSTgeHM/9ATnvNgs/UpjM309E4QfT1GNGW9Q8/ZZGE8rXVCAi4oJsRSNLmizJMCpd
         3x5ZOXRD7WbliGV4Xy7i2WaOdOzid2pI3TsUWwTNAI655ixiBmAh9dmbLPL9ehrewadV
         F8Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335923; x=1795940723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHr5lMNgh4e1muETwY9dGYxImK1kdVOuIl14a1lxYrc=;
        b=fNSiPvOMsyZTBOSrf4P6EgfLMspO4Ca8aYSHodB5TY5CMFCDlED7idZtuIgzQ11t1X
         jAqwn+WbiETFLv4PEw4csJoJ7X6ovwLztbHOcV6MBjgLCppNoRGQeUbq4jK8vXq+SnkC
         ynaUk3zX5Ii7njOMstxV+Slx0Cu/mvv2kpe2sVbmGGzH7YQVihWOY0jkTzCvra8ZcV05
         DKjj+K+/tqKE4YkcZrnJV8rgOZuNzMzeeZHpPfrzLrm4KEIImURUyhk4Fru/2EZJS5bG
         +r2aUaNFZU9wNXMKHEAvDr7qjMBrbqD16QsTGrT1sOjgL/B0UFnT3cnCaFDD0ctamKUL
         nTdw==
X-Gm-Message-State: APuU4Z/l3mNKohC42Cz1twjXoUtmxZZEJ2KE6+Z5UbD0i+gzj0z9KXLo
	GdkhIqpcBFFMhyDbkwYRw/HiY5baQWNDc9qXv6h/7+7J4c28vzjdRnib
X-Gm-Gg: AZFdTZcW+dT48peIShn653ERn7HrcOZ6N5OUVIax19n9RuMq+QsQrIDsbxAcPUEQiPW
	WV6OuPVdiqpppjYS7BVw2Mt8qhAphxHiF555ociyWlaR2ATTT5SqgDnK54kuWb52Z+OV31WJR6P
	geDybvba5YmKPV6MeMSoyeJH9JaTqHTAEeDMft7pQmFk/zNj5liFaIZsecJKnqJLr/lJI2mpOZA
	UVp7xyJhGVkQa0bOw4ueqSX/aJKt3oPFjsF98Anuwj5gpiOCUMbm2e5ivJF+H0Za6Y+XfuE2RAn
	hkko6d0XWK17uoGnDsnb3qymBt397jwq7nCmF01KOiHoj1DrzVJalZv8xwdbqf9rYhzVpxZa66J
	R/kukBdY4rzAy+lNlHDx0S048b/Y6fzqLI7P3TxtCXKuB55IgMmd8SexWxHmuUxmBGiBt40dAq8
	EH81lc17Jc9kkCYHC0kWt35Z2l2KKHYeBbwBchdaLChx0xgxTIL+gsB3j/XF+Jt/M9CxQhTu+CU
	NXF9GnQbdPyy0zC/trbmvw/TiEHO25IQeYvec7EQAghu3HPQtJUtgPGHwowqBZWirE9y7sZqOeB
	0zUjKhc5+fKNJZ9m936Zf1p6bDjuCgilwrE9WK5f7bvwB0cW+L/9hpPN+GTTh0oP9ZAxTgSt2kT
	a/3VSlhOwxQ==
X-Received: by 2002:aa7:d351:0:b0:6b4:86e1:cc67 with SMTP id 4fb4d7f45d1cf-6ba37ea0b91mr3954141a12.27.1795335923506;
        Sun, 22 Nov 2026 00:25:23 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba6f8fa5b9sm2116187a12.37.2026.11.22.00.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:25:21 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Matthias Kaehlcke <mka@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] usb: misc: onboard_usb_dev: Add devices used by ASUS AiO P1801-T
Date: Sun, 22 Nov 2026 10:25:10 +0200
Message-ID: <20261122082512.64304-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

ASUS AiO P1801-T has 2 built-in devices linked via USB which require
basic configuration (reset and power supply). Add them to onboard_usb_dev.

Svyatoslav Ryhel (2):
  usb: misc: onboard_usb_dev: Add Chicony USB2.0 HD UVC WebCam support
  usb: misc: onboard_usb_dev: Add USBest Technology SiS HID Touch
    Controller support

 drivers/usb/misc/onboard_usb_dev.c |  4 ++++
 drivers/usb/misc/onboard_usb_dev.h | 10 ++++++++++
 2 files changed, 14 insertions(+)

-- 
2.53.0

