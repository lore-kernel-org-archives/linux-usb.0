Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CD23750C9
	for <linux-usb@vger.kernel.org>; Tue,  7 Jul 2026 14:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435903; cv=none; b=tf8iMbQ9BPV3cDSnt/EOzm6lSASg8VdvuVWlcKe7HInBr6fuMivKwO73aYFcT3g4wflkyfN39zK9hk/7KgY1fdawnK1OJciB6fUYi8sPy5YeS0tyCAryq8qHadiOQy0KoTiDoU9GVYuN2XMWIj5PEaWrrosKm5Ry8ctFhAuxZCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435903; c=relaxed/simple;
	bh=3482tVTc1e/6rqsx/Zre4BaqdTWNwLcSRHDPFed4KEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DfivFRuRnt4M69Dg3NXlaut8ldaf54is3WASAqRhKu/QTtXbmnAxnX+lESvcQKrPKXntRCvjzCZAt14o9dEuCGqC8jCM9fxIpn9/+sWStPYcCpShwT7VkMtdIt/GJMxlJBORF1A9dSwCYbgW0oBGeazjRPCvMv4Uo9Pco9qfKcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mMofgjP3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mMofgjP3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b7612475so40750395e9.3
        for <linux-usb@vger.kernel.org>; Tue, 07 Jul 2026 07:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435898; x=1784040698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6O0NrUAeAovRNiUS9LYfXTT4948XDdYJQrdiKXv1/xQ=;
        b=mMofgjP3yGPC4BJ/Pg5ZTx+XoNwcocU65DMEHq7xhqoCuCVVLSys/OWH+xkRm2EHl8
         U3IE6aMlSPRbmp4yUyP302lNJY2eM2+JgD+oYouXTREqTUzKU2/c9rn7DBhQljHYjPYu
         PlkeHmFAns/YYqPjsmhLmjLzr+YwF2AYX2jXmHn15ebTl08kZiPQ74q77HXa/SFuoQpo
         +aq7JWdoe5Bsu8Gq9hSVJJDDDhvZGPa5YtXYyu9bAFTLGR/tbF9k9Z+GZFu84u/5uQXx
         qdupFkKyLyAzj3N2FGkadGfu2TMVXRdiMi6dgjjQCY8mY8DUXgtpXjTaiDYSk9479R4S
         XD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435898; x=1784040698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6O0NrUAeAovRNiUS9LYfXTT4948XDdYJQrdiKXv1/xQ=;
        b=Q2U2G0sd3YAj3ciTr6+CeKLTAk6d55vIU/Gm9xnRFp8IQLzxX+unce3fq7/WLy0kWZ
         taBs+de7FKJ/Bt95oKoI8vPh761WBC+/OA9ylsGn3bcBZT7XBD5KPeI4saVWZKguA3Qr
         QDf30gzH0u7dOdpW1Gy4LpIHy4WQMow+euvHr/dftrwpD+QEkZhHYgesAD00oRAQxNeG
         OvaUMsr2hFJlxSwmaIZ6f1d3qulJTZratzm1aoDi/o//movjYOfI7bdROaB+Vku1Wkjg
         pyURP2CofdpZvTcQuwKe9I6ff67fTkJHNuTF5Xkf9UvyisPmrKkCctNr01oMsPe6QNyJ
         mV4w==
X-Forwarded-Encrypted: i=1; AHgh+RrzH6s3VvnWiHY9y0iqZIm8TRdVMDSWL89Wm8mTgtD5fhg4gZXWxOA+exaa8+6XcXJuKLMvusC6G+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe6FMM6uim0JUYnsAt56JMFZC2zaPYxwY24gibp7uFi1EkR9Hx
	R2HYJuJtnlAbK0UCep4p4R0FWoRv3LYTW7TG2o6xu5ZArXGYpD2XPYYD
X-Gm-Gg: AfdE7cmWv+m2NqMnw8q3h/08mG3bf9qR+Bb8v/fLL4+wD4xAeGyXIEoob5OdgD1GBWn
	doCvNkTUQuIGvEKQFQdl+Ug6RxzicCR9PXfL+EmP4YlS+YAj4+3og86TkwuxnO1sl8YMVaTlkTq
	NLS4PMHOF6UuxfoC7gcgZNUChjtaCFw/FZQ8Te0HGtsKTycv8swveOip5lc5wYtGfn68deyE1Ex
	NhNaFxz2N6pPNE+fhbgqJ3KebiXqj1bjADIYGgNtJWCRyKCDIWyPQkNpjcOO1SABNZs6lXyEjcm
	AnnOWFgaf195yN3tJUwHFxfMek3dZ/OHBLqneDiUxJZon4qVSMvbEZP9OTumYDbvO5T3DaY4Peu
	jlogGHxDGysBu0vN7crMAynaAR5Ucj/AxCp5sOskJtMcdqSWtR6Xddx7t7no7WdvlXzK+xImik8
	B3Ns9qI8JREtM7vXha38LRRVf4TDIyrG/lM2iPkA==
X-Received: by 2002:a05:600c:8119:b0:493:d2b1:48d2 with SMTP id 5b1f17b1804b1-493df062c54mr66322825e9.2.1783435898312;
        Tue, 07 Jul 2026 07:51:38 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0ec6e64sm105192695e9.0.2026.07.07.07.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:51:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] Add RZ/G3L USB2.0 function support
Date: Tue,  7 Jul 2026 15:51:29 +0100
Message-ID: <20260707145135.247565-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,
 
This patch series aims to add RZ/G3L USB2.0 function support on RZ/G3L
SMARC EVK. RZ/G3L USB2.0 function IP is almost similar to the IP found the
RZ/G3S.

This dtsi patches is depend upon [1]
[1] https://lore.kernel.org/all/20260707143646.245177-1-biju.das.jz@bp.renesas.com/

Biju Das (3):
  dt-bindings: usb: renesas,usbhs: Document RZ/G3L SoC
  arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Enable USB2.0 function
    support

 .../bindings/usb/renesas,usbhs.yaml           |  1 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 38 +++++++++++++++++++
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  5 +++
 3 files changed, 44 insertions(+)

-- 
2.43.0

