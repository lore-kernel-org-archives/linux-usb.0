Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414991;
	b=lEaEj2qJ1zfo4yUMcza2vesqCimmnHkJS1eMG7f2/HGKWLk2GE1y23h+qWlS/4FlHlOs
	 qZHLFayn6D7B/99yHHr4HVa4I6V9HQ4exl3kx5ozap9h5OAVB7axB4WZZqXYfyyTi0LTs
	 npTW+OsZ5iRiBm+TjaLSvDzprh2/3LlGG9w8REWBlDVslIw9qWcGCVyuLNuCB/L541Nc+
	 E+b8ySwHqcsQNtQzJcIByjMg447LbLmOynZV4KCjLIRNMxKTY7DRnkh1yFfKGX+i0tDKd
	 qp6w2z3sm09zTj0PhV9tQPisYgSdsFHDyZ4sAJa4lrUzS7q+I3bBwAF7hENFJBFnFrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pgzjrQOGvack0Ux0RqI5gfXnGjGneOAYcUfumwqcad4=;
	b=YTETk0CGptBnNdo2oMbTjEVGWAPVLQEivQp1yUOxaJG4x2funA/UeO9n9AAoZqrnabV6
	 WEcKvBuR+dkKEUPMPfGpS1UxYRxJMVIWeJn83bk0t4guSJnlu9vzbEOSJN867sPdTJM0Y
	 BGhjbh3B20vwdw55kmuLl6YN7b4BgVTlvC+7FWxxQT9YFanX+s6f0ndO2sRzfhpnMnhmE
	 aKqpO6URxzPRh6uDiy1iN0EEphKxOIqPLbvf4I3XJddtOzI+CtpytKFlpJ7XlRqACVntr
	 jlZf4k5WnwzZuMfxLrnzjRP/sM7wmGp50dZlT+g/5FaJXS0NULhCzYM2OewmeQq2LeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAqusSx9;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA10606A31A
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 06:23:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA10606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fAqusSx9
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38692f62b22so1315697eec.0
        for <linux-usb@vger.kernel.org>; Sun, 22 Nov 2026 22:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795414990; x=1796019790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgzjrQOGvack0Ux0RqI5gfXnGjGneOAYcUfumwqcad4=;
        b=fAqusSx94ZatdptsvlDWJ2B/wjzk/fIcE/mov/H3R5d++wV2kTKv0YzNh0I8waeqa5
         quCc5++8KLJimu10W5/pQgbNr0jvDI7N7buVdsLqXuWOLEKBLACMWlPIMrzJsbeyNOMT
         yHHPspqd88M6Zjt5KvEuH0AsuCrFthmnXrrtFcakVukpfJc3tsDhCTQb5c7+nKRxeFdi
         K9EK3cMfd/Wk2DGw7hBE/R19Pwse903FdS8su9cwHTCfwUwqbCaOrTvcptnefYRgklbw
         TmKvwuhIryaveSF1VQoXDHfvqxBNsMG0i+/DRXAAJZ6MpfE3auzrSlgQpcV5xdk7fQ+/
         HDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414990; x=1796019790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pgzjrQOGvack0Ux0RqI5gfXnGjGneOAYcUfumwqcad4=;
        b=sdLu0cVsQXNsHzHuWn3v+acI3TDbWs8WEEAsUI8W7b/NPs47Uq4ttl0/Do+dn7cw5w
         SBgbzhmkX4Je/3ePrvky+uxbs0dXE+uyiXQ3gDMUo9yQ9JxhzvFn2QvOTvwP725RMoCV
         x8Uzq82eKaaLfnxZrL2MnoAFDZ7agbo1tUlGjIswMHnP/gqN3AQUuEqDHJq+4rPzzG4z
         u+p8UHkzZPZEQfMF2os4vSdTLb3MzICCcl69szDYbkYmPEjDHyK42gotzVOHVpHqUXVJ
         Raypn1eqBYDOZQ+dSxc7y7e07cIX9LSr1Pb5KhkimS6cAX6geoH9lDH/BJ1/aCNDgmhy
         Cq0A==
X-Forwarded-Encrypted: i=1; AL+hErF6a8IWmmJQO9M+OrldUn4a+4FrkFwhSc5ejECQDtXzhAk8aQ+z6qrZIUkb+0sNB9FTznq1P7AAMfk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MBqRKLvllUy1HI9EHUFtmrWEobSkK3tP//470SFRGutw7Fkai
	594sp140v6MB92Z1hMdS6QmBTajuk6530L4inuhNXGup+xGLNLP4GKg=
X-Gm-Gg: AZFdTZduFQydSP0ntWALap6TFEe78tbwnE0FxCm0KrTIIML/su+weWCvsp+JuoZmX7h
	U1YiHECKqDciPfWgPFOGd201uZhdNiL6H3d9I6jZ363M2rpHWU5raBwqlp98EuIm6/XRxjFjYm4
	ZxgiJRPLH2TO+iggO0XR+m+p+KRD8ogXsd8UiaUWWwUwnyLcuzt2kPUXM8tWi2DY2EUde03a3uL
	O0l2gm2I/BQ5bOd+EY6nausIwnPt5wtj9iXlBHpXSTbPFsh5hYnveZ+Lwv4i4bxhbKGJMY/j+sK
	dF+WyyFzFWQMt1s/BVAFwNCvQzbXmvUMFpNt+Bx49joKpxF+9tLo+c7IVe/f2j8SFlZPVo7KJnO
	GiYKOEkYbx1DWFW8M2U+cYvNKBYTIggpUmUWgvDaohMd7Fvi+xNyAmcmgbwH2iSLmN+tNyeNNgv
	7+bccXr5f5TtHiK/R6MrwmEd25ZcQNwRuQg7hRxI/dEq1R9ST8poRyZxCktNzu8vee4ZvB0hjPJ
	2bfuXbreyCvP2u6gyXiVHP786/dtgkRSfpJpxv0KaYOfk3B4YRmyVtFCuW8TG6RWGZjE1xihsdT
	HisRikkbSLlrLSSi+WtNJlliWQZgBaTbZZttPotNYXlXBe8SfEE9pDL4e3J0g++hExbcb6XDhBg
	BtPhRZHkRKWfF8LVRtIR5l3x2Ez/q9w==
X-Received: by 2002:a05:7300:c00f:10b0:384:bc32:fe6b with SMTP id 5a478bee46e88-3856e63b194mr13329612eec.13.1795414990426;
        Sun, 22 Nov 2026 22:23:10 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009.tailbdca44.ts.net ([27.60.27.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm30844266eec.7.2026.11.22.22.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:23:10 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: atharvatiwarilinuxdev@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: acpi: Get correct location data for Apple macs
Date: Mon, 23 Nov 2026 01:23:04 -0500
Message-ID: <20261123062304.11498-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026112349-gala-unrobed-637d@gregkh>
References: <2026112349-gala-unrobed-637d@gregkh>
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

> Sure, but again, you only check it once, why not just do the logic there
> then and not have any local variables?

I thought of that, but i did not do that because it creates a order dependency
that being USB2.0 has to come before USB3.0 otherwise the code would not work.

> So how have these old systems been working so far with Linux?

The feature itself is not that big, that systems would break without it just
warns about it:

usb: port power management may be unreliable

but new macs provide location info, so i thought to add support for it.
