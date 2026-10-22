Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.228.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792652978;
	b=cx1HVujc5nnZ6JyMWMfDRgUzNcYVz/dfHiDmMcXzuELY2p5GEdzLY6Os5O/0l9IgrXsK
	 n+ongATp96bmMP2vSrToaXFbqJqrfoze5Dvh8TtGTm9tbTta6FuNnadtLiDYaceoo8BZ7
	 M4BjTK4I6lsY7C2H68tR2GIQcAVU4jwDfX7cME8cu1HqiNpf8S7ZW5YrH7ePxOyRJV4W+
	 tTX3l3URAy/ArWPOXDmMlAJ9WRVlYTeM5S/suu/kJHxNNg7zcVaRHuqFlGgvWQiZeD93Z
	 /7ye12ywojSJ1MlKeD9xPFhmcFcUXQ9FmeinsjoqmIJXRAO3V9BiUH7afHnpWhf+a4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792652978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y8vRmEfoyjBwhFBdczVPnT1IHPEuzg+vfDA5yLIzw3o=;
	b=Z21kASY9NTybUaiYuBq84iUfLvBZukLrCvA0Qficb5vf7sZeTywZxuLmd0p7bEilnzAQ
	 2j24U/D+3Yu85K26ZNnWrLbn/ob3vpHMn6rltB+Wv6nmHs2K3tZbN6bDKaFRpO/Zl5DuV
	 r7eZgNkTbZSOrKi4LPJ8eITpLxZIBwpg9Ip44dKpf6bkYYFl/l5dLL9mIXwu2pitp9TO1
	 zFI+FRGbC5o33GT7EpYlJ5mM2Jj/DrqIOorpTwDx0Aaq2K64n6CbA/Y6bkk1EasUohdFW
	 hi4nC30fsbxlBT6kVtMc6ctCk+Rplg6cfrIT2QHo3qjyPPNQsmpVZ2BtmpUanMFbHPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="NpeQI/zS";
	arc=none smtp.remote-ip=74.125.228.9
Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D02606A31A
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 07:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02D02606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NpeQI/zS
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc1631a57d2so264753a12.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 00:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792652977; x=1793257777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8vRmEfoyjBwhFBdczVPnT1IHPEuzg+vfDA5yLIzw3o=;
        b=NpeQI/zSvEQxTUCHDlatv9wagKFyhbSq4iYaKIW5O5xnPR1b1UJnU2mVcSBRe/NycW
         USkvqDpY1Nr2gjg62c98xwoqTZxA2BgDDiHRX9I3lWk/7rtBKJThc4mLd9INLBQWvvVw
         yDF1CMrUm2PDdmhbK0usfcbOAaPfJ2/ICjM8Q0dPigwy5PRFAgnxiJyIbx/Zp/B+FPzm
         VF3d7gPwUZ2IJE1XmdAv9oRuFFHsJWDcKOIBPxO7gIwycmkIii8GcsErzdqCP8lbfItc
         pJcPIFIF3nKIL8hfzBqmSelulYlneGMOpOprXwsSOe7v32PJkPMxn4O/qsKAVx4SNkE6
         i35g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792652977; x=1793257777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y8vRmEfoyjBwhFBdczVPnT1IHPEuzg+vfDA5yLIzw3o=;
        b=R3Fr0Xki5ulPau02t/RL/RTLlPUonXIp8XXkx7dTOxmTWoXKtCpB9S22fKK4uDgyMZ
         LRtTtiIf4XUttzUSZcDoCHt/OtpsOb5a9OoD4XWb6Nlja7oaAsTBEoKe0GcemvxTjdQ6
         JGteYHyjATpMHiYNwSX5oXHz0L/E4oiXKU1JNa1ol3EwbNmD/fKoqutjuvvZ+DeOdZG+
         3lvpWQHKXAAT61f2T01nQthLStzhkWLXJwMbiAHipBY8W93WMJEZXywv8DeNALe+3MC0
         03hh0iRhxKHTnAr/zt9COvu5jCwgE54b+H5fCfPA+MPcb9ouH/sxeSwOdynIrzAvowfi
         aUeQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2Tgyv8CRiOuYO1QRsJijE4YX+OZyitqVcuLYFVIG2OBClzJVa3LjoPv0pjM4PjwFCgwuxQdNMsss=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMHoF5OHAE/Klb+i8KTOHRUITw8lWAnEA4uTnWhpl27IHo5rRQ
	ZnTeUUl6usVPYmgCzweda86xpRTDtMaTCPb+qTobPqxUN1691Oa9irme
X-Gm-Gg: AYBFou0zLKZac5vpQYrMgmF9mmE53zHcdglgBVUZSQ+LYrMLSybLyiJ1AeUyvEpS70n
	EBtLQx8wn7RkVnuWAqG2dyG1zwe4O++mZS/qegcBOV18FkO0m5RAaHt81XHtGOE8aQMWRTDV2s1
	fez07uXrZhRS2i6YyLkyekWpnj1tGggAwxKkY+V8EFTngCfAtx7Mlaa8U4ChjylcrcyU6ZLqega
	0OfixLqXXYwu5KbnPFKwi43EIb/aHrKOGQNR/i/eTWjLTOEAx4mRiKsTlUlUViG+7x/JrJeJ480
	UZourGclz+LQNV9lRHcmHR3RyrFq6pppDjFRcAnLeKn7lDoRwQacTKIefOzA2k+tt2n8jr2lzUm
	DYaqkwmlsSJrGqPguws7zTeODA61ppUYp061kqb/0IzKo7iGeS0XCfcRP9yNo5OpUGpJxiwZasr
	kGxBsVlbNKqOddFAmddmNVYastjpU+vIHbYLFzdUxbXD5u/TnCUe6LUZZ/msS01SvAIHx2JmkGQ
	8qMg4UTMzoTiSwBzUvoQYGEEsynlhJcN6cPlXbVYNbtzjRxoXHjIw72eQe7UiDSm28k6WbvtA==
X-Received: by 2002:a05:6a00:1883:b0:8a0:73d7:aa7f with SMTP id d2e1a72fcca58-8a089e90a35mr3761029b3a.41.1792652977248;
        Thu, 22 Oct 2026 00:09:37 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b49d1sm1706039b3a.12.2026.10.22.00.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:09:36 -0700 (PDT)
From: Shihuang Liu <shlomojune6@gmail.com>
To: linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Alejandro Colomar <alx+linux-hardening@kernel.org>,
	Shihuang Liu <shlomojune6@gmail.com>
Subject: [PATCH v2 RESEND 0/6] USB: add usb_make_subpath() to replace strlcat() in input drivers
Date: Thu, 22 Oct 2026 15:09:23 +0800
Message-ID: <20261022070929.20820-1-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021123146.17202-1-shlomojune6@gmail.com>
References: <20261021123146.17202-1-shlomojune6@gmail.com>
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

Several USB input drivers build their physical device paths by calling
usb_make_path() and then appending "/input0" or "/input1" with strlcat().

In preparation for removing the deprecated strlcat() API [1], introduce
usb_make_subpath() and convert these callers to use it.

Patch 1 adds the helper in include/linux/usb.h. Patches 2-6 convert the
joystick, misc, mouse, tablet and touchscreen drivers, respectively.

Link: https://github.com/KSPP/linux/issues/370 [1]
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>

---
This is a resend of v2 to include the USB maintainers and mailing list
that I missed in the original posting.

Original v2:
https://lore.kernel.org/r/20261021123146.17202-1-shlomojune6@gmail.com/

No changes to the patches since v2

Changes in v2:
  - Add usb_make_subpath() as the first patch in the series.
  - Use the helper instead of open-coding strnlen() and strscpy() in
    each input driver.
  - Link to v1: https://lore.kernel.org/all/20261016170411.51025-1-shlomojune6@gmail.com/

---

Shihuang Liu (6):
  USB: add usb_make_subpath() for formatted device subpaths
  Input: joystick - use usb_make_subpath()
  Input: misc - use usb_make_subpath()
  Input: mouse - use usb_make_subpath()
  Input: tablet - use usb_make_subpath()
  Input: touchscreen - use usb_make_subpath()

 drivers/input/joystick/pxrc.c              |  3 +--
 drivers/input/joystick/xpad.c              |  3 +--
 drivers/input/misc/ati_remote2.c           |  3 +--
 drivers/input/misc/cm109.c                 |  3 +--
 drivers/input/misc/ims-pcu.c               |  6 ++---
 drivers/input/misc/keyspan_remote.c        |  3 +--
 drivers/input/misc/powermate.c             |  3 +--
 drivers/input/misc/yealink.c               |  3 +--
 drivers/input/mouse/appletouch.c           |  3 +--
 drivers/input/mouse/bcm5974.c              |  3 +--
 drivers/input/mouse/synaptics_usb.c        |  3 +--
 drivers/input/tablet/acecad.c              |  3 +--
 drivers/input/tablet/aiptek.c              |  6 ++---
 drivers/input/tablet/hanwang.c             |  3 +--
 drivers/input/tablet/kbtab.c               |  3 +--
 drivers/input/tablet/pegasus_notetaker.c   |  3 +--
 drivers/input/touchscreen/sur40.c          |  3 +--
 drivers/input/touchscreen/usbtouchscreen.c |  3 +--
 include/linux/usb.h                        | 29 ++++++++++++++++++++++
 19 files changed, 49 insertions(+), 40 deletions(-)

-- 
2.43.0
