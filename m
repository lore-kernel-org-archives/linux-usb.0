Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425827;
	b=GUMiNe416bXQASJ0IG3Cs1V1lykenmpuOScfdtbxvgwNd/lxPbyb/fbwoTbMz/5d438j
	 3w7itkJ1Ymagn6VumWUU7lN0olOoHm5SVXhGPCflChozX7Yf9yUa/0aVmwMcW1vYvvT/U
	 hA/EUKSbzO1P6Epz9kfqGoTIQJ9ZwyxIniJ+mAj6Oe0AFaNVnTTCe5XDJyY5sExrzqm5f
	 1jD3z4HDSVShjEJOKyTOB9Yfnh+TtcNWyfgYoOEAVj6BVW2kf3q//F+chvQ1Yyk03NuSm
	 fZE/tAx3xz9cKWT7b2oJIN335KyFdjDdt4kahrQ+2LoIztbaJErb6iP1fzMacH7C2XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k4/rvLgtcMpaUxMn6Fqp7RLo2TbuALQdqASFTyuNpDE=;
	b=v8FmtHFN57KlbGVYlSZyC555OnSyU3s1IbKgaKn6LjEWYS+veGtqNu9GhN2K8zZKtfho
	 1ePWHOf4uY8yqhbJKnd/GPAXJUMW6eqZhDrzJaiZCXRnxX+5TNGXLNcAT3GjOTWQXdW7X
	 XVrj05iqkv/obWt7p8koPABokiN35PD8N81ta2I+gJmUQVOu32wmIsPz1CTG8JkYH9AKt
	 xCUeldfJcnYvJ20mJxh46W2f1kEPiBhe5bFRfoLkDrRIUvM+KuIVVV5pvWjuY8d2wEuuL
	 i3P/zg7ncCRbO7mXmvbLIHLFpuKngrg8lFYFmgfJf3pEoJ31vlmc2qbo55iq6N3ptDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vT3U33Gm;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C89B606A327
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 09:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C89B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vT3U33Gm
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so26036885e9.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 01:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795425825; x=1796030625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k4/rvLgtcMpaUxMn6Fqp7RLo2TbuALQdqASFTyuNpDE=;
        b=vT3U33Gm26/ZBgMRRlulxFYfcmGhlmydeqlDpIYjryTLrt+9HHB5QzPpvbD1JGiCKA
         G3t7XUa+ZBfUsfjF+OGv7+OZSpuia+iqVVIEpK4rk44oA2JeubiWqm7/XlnkGzH9qF7K
         Ib/6d95d/k2swjHCQnuJ0Ss1R9Wl2uGAqJ0mn2A3mVlWrT1XNk4EUDcRKEpbjPomOpCk
         03fZ/EdBRbTduuTsgO0g3lk47+jPVtLcFj8g1fv86fKaHHmOw5D7lvWrypXoyxbVTW+u
         3ZgSB0n7cmcclWhWJ+hR8Pc6IQFzJdhRw3czAOogo8CtbKEoJVoa0yzjbVZbgd0MYB0X
         0q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425825; x=1796030625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4/rvLgtcMpaUxMn6Fqp7RLo2TbuALQdqASFTyuNpDE=;
        b=rBPm0K7H4d8IwzE+3BrNimEqyxXwv2X8CEprrsc7KhzJKouXXkAz1fTJdN4skVSuCQ
         dCt5SA4KDEhmkUshKDSyYnknBzzag2Jr3kCHxHRixiLcu6OShNkNWoRjH2rkhAWET3YH
         uwBnCCSNwEKVtXmsPsmuoO+BZMO0so3cH1YwLeSXG87X4j6oNTZdq1cdhbPF/tX6tsqL
         oCsZJkF7Qt7J7uUg4JF6pOEd0U2Ds35iBbaCAQ9/n1FZGiW8SDTzJpClU/G9T5cswRhv
         +xe2CRDrj9GH8KAj/nF3U/yymwDaERtb3Ghw4VzufdOW27SyOsla9UKZzxUFJ7zhNRWq
         9Fng==
X-Forwarded-Encrypted: i=1; AL+hErH/WSOSSDQWBVrIFpnm1eW/b5C3bgfJ498fTZz2ES3etVx38sjybSsV6IYl6PwHNpQY+eq6bBbrepc=@vger.kernel.org
X-Gm-Message-State: APuU4Z88rjRimXZjpvOwgXyAPogAFUG74YWSU8fJmIATijslb/DN6Ybs
	pgF5rNdAnVzH9+I+5FOJBzZrqLvyYJo9lD3lqQJjTsNNZ9Ka9yAjgc39
X-Gm-Gg: AZFdTZfBVyBLQm7rNdY+im2aGD4P3pgDzxO1k93uhdnzSGZcq80F5eLqTt1uTDToATD
	htwpWOlgf02xPnTrLj1dXdG4zrYotJxG00w+cqsZ1jSxf5/eB8wr+K6BpqabaNd0Q4WtCa4MjQM
	iMC03CvEJU38QUsWU3nz5miiyS3ioYeeeXW3uiqwNowEXYdOEf8AKlNdIqa8gdW/HnoBegRKadm
	74u8Se7q7eXCORJFqOX/9KNTXUoFsv/q2QJTP3ShyIu/Pko5L5YI0zSCUpLw8fycmSeo+7C3bgg
	Gji9jMfVhByiERpcm5yFaJHVEEIwgI6QtVs8SYTodY6qeVE+BXbdHX5W0f+T6+nUguLamWDaCEM
	YMGYSsQ8STr7f/u5PbYvw1b+EuiTnJgqm74LGHH56aj0mWvA62sSlBKpn3PBssUQ6hXN1od4Fgz
	625q5U1QjpBNolfFfDYObSwYKKivKIbrrungPnBqbA7lXKRKq9t2gvvtQts794yJKgoElKEdMfa
	ZEkUL0OP8Pg13xw4ujaVSRPCulVBakl+TdtNjcjbewx9+9pNGymKZp12R4fu8EZE8PXFSMLsIzQ
	vQ8zoL0Nn0MV4nUc+14iSkFurYU30lwzI8PUXjCHM1I6y5ZkMPBEthOBnC+aRtL2qp0LgUcifcQ
	pwxhRKEHmbhfnh1j0E59XldVARMyeV+5iYqk=
X-Received: by 2002:a05:600c:4f0f:b0:4bb:87f4:3674 with SMTP id 5b1f17b1804b1-4bb8880ef40mr276942035e9.15.1795425825278;
        Mon, 23 Nov 2026 01:23:45 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm21060655f8f.50.2026.11.23.01.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:23:44 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Umer Uddin <umer.uddin@mentallysanemainliners.org>
Subject: [PATCH v2 0/5] Add USB support to Exynos7885
Date: Mon, 23 Nov 2026 10:22:37 +0100
Message-ID: <20261123092244.1792040-1-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
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

This set of patches adds support for USB on the Exynos7885 SoC.
 
The Exynos7885 has a DWC3 compatible USB controller and an Exynos USB
PHY that theoretically supports USB3 SuperSpeed, but is not implemented
in any known device. The vendor kernel also stubs out USB3 functions, so
we do not support it.

This is a v2 of a previous set [1], which was split into a clk patchset
I did submit back in 2024 and eventually it got applied, and this set,
which I never ended up submitting until now.

This version fixes some things noted by Krzysztof Kozlowski, and also
contains a change made by Umer Uddin, as he recently tried to resubmit
my old patches from github [2], fixing some things up, but missing the
previous remarks.

[1] https://lore.kernel.org/linux-samsung-soc/20240804215458.404085-1-virag.david003@gmail.com/
[2] https://lore.kernel.org/linux-samsung-soc/20261119-gta3xllte-usb-battery-v1-0-0cf5f763522e@mentallysanemainliners.org/

Changes in v2:
- Clk changes not included as they are already applied
- Add Reviewed-by: tags where appropriate
- Use samsung,exynos850-dwusb3 fallback compatible for dwusb3
- Use unsigned long for set_ref_clk_rate
- (from Umer Uddin:) Error-check clk_set_rate, and fail if returns an
  error.
- Keep dt nodes ordered by unit address.

David Virag (5):
  dt-bindings: phy: samsung,usb3-drd-phy: Add Exynos7885 support
  dt-bindings: usb: samsung,exynos-dwc3: Add Exynos7885 support
  phy: exynos5-usbdrd: support Exynos7885 USB PHY
  arm64: dts: exynos: Enable USB in Exynos7885
  arm64: dts: exynos: exynos7885-jackpotlte: Enable USB support

 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 ++
 .../bindings/usb/samsung,exynos-dwc3.yaml     |  3 ++
 .../boot/dts/exynos/exynos7885-jackpotlte.dts | 20 +++++++++++
 arch/arm64/boot/dts/exynos/exynos7885.dtsi    | 36 +++++++++++++++++++
 drivers/phy/samsung/phy-exynos5-usbdrd.c      | 26 ++++++++++++++
 include/linux/soc/samsung/exynos-regs-pmu.h   |  3 ++
 6 files changed, 90 insertions(+)


base-commit: 5d7b9f865597a74b323d512619c42f3e07ae043a
-- 
2.56.1

