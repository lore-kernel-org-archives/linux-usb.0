Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713874;
	b=SeA3d1QB2MkUAz0hVaU+gdsppbbcFQuq3pOkwFqNm2KXkSnyQs9sCuTzsElqVLp7T/Pl
	 S/aOgI0N62R/8RJsa90+1g2e/DJDUYiZT3fFyvlC6J1jZCX/JDUoEg/497sauR5IN0KF4
	 hOv4ql2g3wfzROeM366y/JN5xVBeTqiXpNXqo9T+yoNjUX0y/MbYATCBrG0N09wWa+FL8
	 HCod51OCGjqpWElOdFTliQfXZchbt4HKMU+grJ3aOr9m0cpWcMW28veg4u3HI81QRhq/A
	 swkOTfy5i97mXoAup94bSsRkvehOa6n4wv3siHsbg0aOJ+jElu4CH5OA00NpjUXJHKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=khEl6AiVmGdFxootcAKTxbxTqRouR+Ypn7yM7tzmVes=;
	b=5E24D3geso2zsVbb+hN+Aj6lIxLvxlZZEshTyFHfcX0N3xWZWD8NVxjLA9c8+s7ZU/4r
	 wboOfDWW2oKGBlkNKAWAf25tgPNGvtaAIsqjhVkzsLd+tubiTx+0uT9K3KuOaTWoKznXy
	 x1CgUxuhbZFssv5jqv42PFWLqVJfdntAhM5MgXnKu+WBbSoL7NkjXatcmEAyvUND+45Z7
	 tncQsnIb3NaeeWK7D5mxjkJN2fEKjYCOYHQvag21A5s8bivrHOWaoj5wnvhb4WD1cAKku
	 ATIiWhhg6NBh1tKKKNJMWx40SafSVlOv2HrmwsizWdEdo5vVXhmlFhhQ2r3TT7oF4dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ublNyEuV;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692C26083607
	for <linux-usb@vger.kernel.org>; Tue,  3 Nov 2026 13:51:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 692C26083607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ublNyEuV
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-353804b591eso7255084eec.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 05:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713873; x=1794318673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khEl6AiVmGdFxootcAKTxbxTqRouR+Ypn7yM7tzmVes=;
        b=ublNyEuVZhEs1i6z93JX/R8YewpZyMQAk3YlLFwfuXYBFSs4sfkWLWIfpH7P/AJNuS
         5qixV2Ch2exi433cUqhwtamsH5RTjKKU5h+UnV5JwGoMz+/z5255XiDa4N8V1E1e5/5m
         xIef+CIO+jQgdVmK4fVDAbtkxiq0uhCruvAI43NOs9cjwT12hiRlo91JCbLIKW80eVtA
         AT2480xZi4B6M19h6dw5RIaZjKogbNOIf3kkerNxRy0JgoNulp0m+f42w0sQV9RigTM6
         LTzwtARR6jVp6JcgqjxdNtoiPMyOT/xT5JoPXvxsPpU9wQ//lqBy9S1SjrH+olHgj9zq
         xKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713873; x=1794318673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=khEl6AiVmGdFxootcAKTxbxTqRouR+Ypn7yM7tzmVes=;
        b=ED+gjsrauwsZyP/h39/GiA9nLvvZCwmzWzGIuq41VNF2ODiYnJOE54BKMrmha4hMt3
         ILg2Y2HImOH7tZh3WG2Dj2lVdnrptFToRKed2voHLyLUy1SqPmQWWw0nuypX0cP0Ab6l
         SUD49ChxADutoNDKKCCc4hkwFKpjxqcn4Vo/Aaz8zL+wgI0t4WyJ6eB7k6kfe2G/wTGN
         0LBUyTvgPJ0UW8XmncoKVDOdK8FPNp6qU7PZv5Ynvqs3PRvkS7p7rhtHujycGuBagpfy
         rp2NX+S79pTyJhM7yfpYf1M0o4ZZaHHwrjNo+bUgSJU2zeUspugcUJ2ZWs3C7jIxiBdk
         3/GA==
X-Forwarded-Encrypted: i=1; AKwUvBxdMPN7aPD0W7LZRSSXXoWXpBbfyHmjj2ShYhZgf9MFYvty8XRbKhURjj0IMMATojLpMeoBCJ0M0V4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zgvPkTEgV6Er2POW3JJC6qMnKIlKLiHcwoMzGvmx+6Y2BDn7B
	QKBAhwci9gROL1jsS+XHxyXI+AB/k5JsERo1762St0PO+zGT0LuSyqtl
X-Gm-Gg: AYBFou1DVpv0MDhSmKgpBIN+1njbjoSR5UhTDYysU3dGGb33KYmlHH0K3QYJYfU0via
	RK0xBRMWZxVjfpHW5ESG+FH3Pk6mHpr2XUlihDkqsJ3SQb7GJBbD3U4Iiq2E7Acw+vA4OXM9WL4
	Pk1XhSSMRVmVo1rn3ZSXVC/QTjkiIfBoAujrfixTjWXab87bAWJb0TCnJvr7iS2oKMWvU68G/lq
	GA9pG1HX/R91Wnu99gXfIFPIBwHYyge/EWCaMcpDSQZTOAuBPj1EoeV/sI9zzmVT+q3Q6Ob74vb
	PhznyXzqjIqoxaynm4OFnhkyAQQa2bee/MDJ4Xl6beKziIzTXjCKGCts/jacgxcACb53KlXFxP4
	XLacpLjgkq/e6aA0f3atNzJ7q4Keqttmte3UiavHM8bacgIWHn/BdDS/ciNCZWpZVcKmWnMes9D
	7e6FXGytGPgfOqLdB0d7vL0cU47byv0UciDv35Xptf0EMNGdUOLy29dNhqzHLBcvbn3avdcBOU8
	g4ZoikiJQh/9bBOhMUikRbGBYELIqxEKhiOhxwdBzdEWQcmgs+Nk5vlsriSzo3a+xmH9ZSouPsW
	TXdZM/XeqQJN6QgQxl2YUdpfo8dKEidX2AdbmWEjpUSn
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1ac5c92de5dmr24655310c88.27.1793713872384;
        Tue, 03 Nov 2026 05:51:12 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm42837321c88.5.2026.11.03.05.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:51:11 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abel.vesa@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch
Date: Tue,  3 Nov 2026 22:50:57 +0900
Message-ID: <20261103135057.1682-4-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261103135057.1682-1-26rote@gmail.com>
References: <20261103135057.1682-1-26rote@gmail.com>
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

When the USB3-DP combo PHY is a mode switch, DisplayPort pin
assignments C and E put it in DP-only mode, where it stops the USB3
PIPE clock. Make the USB controller a mode switch as well, so that it
moves to the UTMI clock first and keeps its USB 2.0 port working.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
The "mode-switch" property of usb_dp_qmpphy comes with patch 3 of
Balaji Kalkonda's Kaanapali DisplayPort series:
https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..a06d5d867488 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3941,6 +3941,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			tx-fifo-resize;
 			dma-coherent;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 
-- 
2.43.0

