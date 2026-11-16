Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864484;
	b=Lw3RiPUTF1MXvbUAHwl69drygBA8wDkNe/Egnk3A1MMBtmZKzOM0gpAhoTrx1NjpzWVa
	 kp9nfRkMY2ZciyghvXjySfnIDyAky3yTFPypqPswch/HzRl2VkgpCUwPVf8oFo6WyHxGb
	 sHXAJitAAmw0J/NOXbZgp9BPXMVYozBMUjSQZ2zxt0caN/eit2OksGnyg3XBPVJu2BCPv
	 Z37M0yMHbTqNkXQLOnoGZ3aFRJvBrEfG67+I/ubKq3g6SN7QxpfKDM0LuwFrJK41hjOq8
	 UGnKnHgNpEQpvyl+NWjanjgx+c6qETP9K0VQ7WEPZclqFlh+7DS1LzcnX3WbD0S0Jcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
	b=Y5xIpdChgXQf1APcOBWi9sbgAcZ7431kKGCtfSMnjJRVaTdQECOb6DH/qJCjkJueTLd4
	 F9W2wy0PZ2KSSJWZaSN5DlU+VNdTJzgKKK/coob3et8Z8F+Ru/kxA2xHeqclvVbe46esn
	 R8aLimzuReDpMMJJ3wnaWqU3s9T0pQpZT8HwhjzkLkiL0Tc7+g9aPe7LJJuQ+vaz+SLbo
	 xVdOshyYqhUvo/2CX6zDWKPoz9kPn6aUWzyHSJOeV22d63N53tAH9WuKlDhc92/TQOP4M
	 jfjepZdq1GM8Eo8YPJIRkdjdju71daXaTbRujUVx0+xIYn53D7ZPlQTAbIFbtD0SK5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGH3kEag;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F03606A882
	for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 21:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5F03606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UGH3kEag
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4246489f8f.2
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2026 13:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864482; x=1795469282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=UGH3kEag7+QnSPw8NgN0my144BL9MI6P+lzS4lSmWpGQLU/I1Wj2jG9zLis6cKkcyN
         ttu90mcZBjnspWeaKA1sIRwB9cdXaff25bi0pIzo2nlZOYJTE5UudY0yiqgN+oIc1Gk4
         27gWEvQJDPseqUIJdZV/bKhN6eyFQZ7udD/C2KLm+okaF7uw60hj4NRq7HAVpwg467V9
         MmOa42/K0JqbfZnd737Yd7PfrKLwppbtes0cyHasCRpOwm/EKfvIwi9YyvfmdII+iysG
         TW0GSAVvcD/jtsTLZMB/5KuH/HSlooTeqSEMLMXw4y/dOpM0oYUhyTRXoRWTIM99mqwk
         kqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864482; x=1795469282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TdMvk4MSLOM7B2AUfqYT5uxdywhrc23UXtZE8vgWzQ=;
        b=lFxDebQk76FWsswrBOKJvg14ZW+Q1hXvvUuOlJEISNTS2jgCQ+MNtashl/Vuh/5tEa
         myw8B3UHBUzWHenMOZxX4F78mZ4aKW05v7yjEGRv/G3eLbOoGMs8geS6LD4i5ZPaDswA
         OWh+2srlguecAdHQucZfCOhkXE1Oq4bLjriZ3MtQpFBAVVGql4Yc9QD7Hbfm5Yy6y9fS
         psplyLxtaY5F+qFC+ziQZShu/NCNmdWCvoZuD16+VtgSkYEmqg2RpcimScDN4XqZ9Vtk
         WP7HFCmerQ/SLlS1QNkRvFuGcErNOiFROXDCK58x5zHFhzrUCfM09iCOCBMoVqEvKMEz
         BeIw==
X-Forwarded-Encrypted: i=1; AL+hErE/3Vi0aj61jx5nU13E9Yl5IxCajx559yvFm9TYGFJ5G/GtobD3gKh6LZNtBgW8aIlnFeYGPB/DQJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oQbv6xJxDwNP2ghyk+PvaqOyhQpo4wco/wqU0wk5Tuj5mFX/S
	G1QWYBVktHHuCO8gsv0euPgas3acjuRfvSfXTWaEVpH8HtW78nkSZO+g
X-Gm-Gg: AZFdTZdAbRpNOW5VWvaNprL1qPlUjqRtwyYH9/rdyMiVDvtRlqafqqrgkApWFrjgVLE
	PVG3j3B680sHdnqBzRw1zcck3NwGH9fncOPdhT8SECEX/dP+ZtrKXmVvo3zZ74/fNy0KkifP9ok
	QfzoOpu31BpvMi0uU+N+ta6v5Nbs/DFkZdqud3T0laXvJT8bEeeEYRsTH0NzY7g8kSoJ39sWknB
	dPtwn4EdV19JTjt6N/GFbXssh0osUNUuc7JhWAh5zFGzXCfLrzBNGw26ZaB3zxSjFvfPQRdRRmW
	XhTOiucFgpM1nwISrQOgTEMOp6Xu20qZAg9Z2l2PPl6aD3wHy9rILW249eZG2HknoGM+fdpNxJs
	FCN4wDlVxHZPi9rg2wOgVelwp9mAey/g5prX8wR5EBjYM6QBxwf5LFma4DWvOnIEd/ylPVb2Asc
	P3x3yZw86W0sAC6K3F0JarUHCp0hF5AQGz1NhMp73dyv0JBEFUC577w+CrLHAE67fpmNRKMRUx6
	XgC1FeB+21ymRaeQ64LMNwU+XcfC7luPzBvuUJSeGW/GNh/P6ks1202DGWin2kEfSReBerFdFR/
	LfbtmTP0sZcz3OSIjdpxRRCeEqj8D0uENxYQbKNv
X-Received: by 2002:a05:6000:5c7:b0:48d:f996:1814 with SMTP id ffacd0b85a97d-49c7325b40amr23107019f8f.57.1794864482125;
        Mon, 16 Nov 2026 13:28:02 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a378138cfdsm1260150f8f.58.2026.11.16.13.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:28:00 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:26:30 +0000
Subject: [PATCH v2 14/16] soc: qcom: socinfo: Add SXR2250P SoC ID
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-halliday-dts-v2-14-2c92438c6c46@gmail.com>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
In-Reply-To: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864382; l=679;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=6bC47xmeKrVS8XaUkfpVIXGQqamVpsrDydmAXACmpko=;
 b=L3bECMGWqB70KSAXliPLAtrm9JvwyHz3xUlIS/JSaVuyDRybXKh4TJZIKniI807WZa1pL3+Ja
 bm5mXrDXMYUCX9Qe7poGqRt5BD+3P/4++4UczCRJAuB1UHs6hFIK/pI
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the SoC ID for the Qualcomm SXR2250P (Snapdragon XR2+ Gen 2).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 38efc5db7fa8..c5b61d28fc9d 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -529,6 +529,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(SM7635) },
 	{ qcom_board_id(SM6650) },
 	{ qcom_board_id(SM6650P) },
+	{ qcom_board_id(SXR2250P) },
 	{ qcom_board_id(IPQ5321) },
 	{ qcom_board_id(IPQ5424) },
 	{ qcom_board_id(QCM6690) },

-- 
2.55.0

