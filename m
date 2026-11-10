Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294422;
	b=UDO2i8OwDtw1GL1ccqZzH9RHvxMjRBr/oNZBMXBAUf1vAZEvOqgtXVjq+2T9GzgdpfkS
	 rHV9Hbyf0Gwo3vD9rbANIsAaQ3hMWFGjrwXmtINg2sx85MGZvGdtCWT2QswFOiRR0uFuP
	 QRihEBAQKmR2tIIbDs6RAaDWHDT2cuzc2riCv84438D4Xh7Q4n0O/K98Maq+nLgbuVe2u
	 dRqq9fAbDZRH925iqxfm5LIuRozdSfjGTio95BCltgjhwlEEAiQ+k0Y8bgzvfhoDkXw86
	 LTa/SceYVEkoy6YWO4+GUBWgdsyG/V/1d3qO45GZZ94V4ePbgSileWzNTaZmecic6ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pcGi4IiEaNQ770jDWGR1vje4TCdM+wZvKI7Z0ggaKDU=;
	b=PqOoyuire1VHVMqPA97p9DCkiNqD0dbaF/2J+vNDQ167bVzv/6EwLFCDBK7WUdXm8wyt
	 xl7NcjdLHkVOxT2HMkqNb1PfC1J0xWoX9Y8z/W5Pl9Perxu07Nvps43j9Cyu8XvMf/aty
	 r6xoybRp+i1bo6/z4KrmjmVEBkR2n5sC1LKBac98ROQj7zA91jQ2EXy9VPq5En73wVtHm
	 CYY4I3qXaB4fbLz+a7ot1T8OZAyEaQo8hYgbzbIs3SYhNFH+eB2ul+1KOfX2635+YdWqP
	 g8pRjbe4oWgipX5wLdzCVcWVLZkgMatUKi8WQiJEgn4KcwGcWebBfg5I+TrfSQ8i3Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhaAaEfB;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490C260A261C
	for <linux-usb@vger.kernel.org>; Tue, 10 Nov 2026 07:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 490C260A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhaAaEfB
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso871858a91.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 23:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294422; x=1794899222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pcGi4IiEaNQ770jDWGR1vje4TCdM+wZvKI7Z0ggaKDU=;
        b=YhaAaEfBMqkZB+0+kqOLkFu3Xbj2X82jBIa1LXxTPlBEdGlO/dFnpCzU3C7tRpFkad
         IQDD1LkCDyDv36DcsX1U07i4SK1lTkiEbBUFV/iZlKXFiHgD85rK0WXV0+J5Wrzxw1PG
         BSN6UJW9CvXpYcXjIuqRuYrLFPewQU3HV398YzFazEXAelqV0Wi1pwgYUc7r198gkhq2
         gkG/R5JAfLCl1RE3e1n1RPZQnyhN2DMJwS6pQLJTxgQfHRY5SM7VvuIPnONRjmff4KBH
         dP8D6NiNgbueKR83PGPZJA4T9yFxlYWlwB2Uhx0ZPeBGqPo6bB8IRdNiC++4NdyWpoge
         4F8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294422; x=1794899222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pcGi4IiEaNQ770jDWGR1vje4TCdM+wZvKI7Z0ggaKDU=;
        b=PWjDqal6uPiTtSGHwPZuU13q2wUkHJl76ef0YdcNmJRTZUCAhqgswO9jg1yTYuoS6+
         wTSzNPet2xuCs66Mb7VDQBh/1kCn/uU5yzH/jZwy6gl26QuImDzCjJwwtaEZaieusdi7
         Qn07RnGrLTZMkZG5xrbsux1lTtIgROjh1g5efLavN+u/Ee4S5UZaV+Lt+fd0zyJqecNG
         Cmv37WGafFZrJ14zZHdDldWDpNtCGqgis7J54unaES/RyOHPOs+K70CJh0rLxaBAcxkW
         QNXUjQV9k0qkZg4xk0du7n++Yk3xK3JZ+KIyQNYyAnnb8/lyJ4oLWP50Jj/z++O3gsqk
         PYmg==
X-Forwarded-Encrypted: i=1; AL+hErHMKHyVjAM2ASUM+r+i1X+l2NL8hNoOD4C3QKYXWY6NPhjcoPFa2/JTGlUFwy+n9fk3Ww7vIxC3PdY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gQIPoC3DMvJREZBS58gMpxtaNxN5++x79+2pVdD6OuTRx7Nm2
	YMYeIikRCvZONHQp8IoIgVujMri6E2jwdcmE+7rI7Bmu+b2/uqu0j3WR
X-Gm-Gg: AYBFou0J6VDYKgWwdzLeOq9UzB/wgbocE3VIAzOLgOqYr8x2Txg//lWL5TKU3/xtE0r
	1iL5BOYECF+vhuYWgrSnIMECMEhsP6LOSqR5BU01I2hGlSNs8FrDVRaURh0iPYeTmdkdGwx8BMu
	7q06gOcfaXVWL3tFwepldRJC/sDUUc3hf6Sd/bYlbhPJiKLJDGJj/luufgPFD8vRuxfyFQ5iC72
	T/TL3+wIenw+rH3viavZ2uPNp7iOrkk732lit7f8ggpeCalYf3FyO9dWagke5Apwfd+hp3wxPL7
	fAqvpUc/j3ssQecJ/MEYprYtl2IA35wCr7/wZXSC/0ozfcgkprPY3ZdcFjS7o6PKlejsrW8Mm9w
	5+sWOXP6NJooB2fOyt257bXBBPUvo1KiLN+wZGMSD7nhSQK+1KRpTffs863aebFn90zJX7hPu9G
	1qxQzIzTRnebWeFznIMc+Y0WZcBdTdDzacTDbtrECttRh57mdq0yJAPsOtxxZiZ0XFvfkWY2eJA
	QWP6a3tcdLbyUqJ0csfewAqCtgOu8sPz42x7VW6VuwFAyJi8xep2mZrzUpLuOVxUuNhfxQsPCyO
	XKOedoLgru2vZnY69xVygni2wQdqWjPZmSX/E7VYxxNGHMlt
X-Received: by 2002:a17:90b:5805:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3b166c89a3dmr2067491a91.13.1794294421656;
        Mon, 09 Nov 2026 23:07:01 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b167715fd4sm2625930a91.11.2026.11.09.23.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:07:01 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Longbin Li <looong.bin@gmail.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 4/4] riscv: dts: sophgo: Enable USB role switch on Huashan PI
Date: Tue, 10 Nov 2026 15:06:25 +0800
Message-ID: <20261110070627.217946-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110070627.217946-1-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
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

As current the DWC2 support role switch on CV18XX SoCs. Enable it
on Huashan PI.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index aedf79f47407..bf3d58c355c3 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -88,6 +88,8 @@ &uart0 {
 };
 
 &usb {
-	dr_mode = "host";
+	dr_mode = "otg";
+	usb-role-switch;
+	role-switch-default-mode = "host";
 	status = "okay";
 };
-- 
2.56.0

