Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795468663;
	b=hLa3+f0S4M2O7BD/qXj/U5nloDCub99wu5ft9CeudpwIR6kCGB6I8B4LdXf7adSMwG2x
	 Tmk+H6VDxDHkDLqupsGPD9Wr1bb4+kFB0ZVEVlhMF3ag9089AdQincHDvT8t0Wv/I7Io7
	 Jb1NmujZO1Jv9BPilAiORWozlEBF6HdquA6MGAqnIXSOyuFsA2n2y3p+v8Xc73HA7Ustp
	 FNo0JAGXT3k/ogmcTGRN7/jvgBjX4aH6xQLX+Obcy0RzL8VDjAAR5n7g96gpeMEuM0QFn
	 KxZbrskLvvzO6MHVn3LxuWxXq87EfOuSGfn1MvR4R01F4yyrpV7Yem5lcKrHukiVVbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mEI2MWJHKjiB6vj3bpQygFD6VsBJJyxeJ4zAlBvCIuE=;
	b=T8Hlse1mL0EkfrFbqqps8lIE3e5a9Jky5hc6DDqdvEXwcRGevfJLf7uw6xoVAej+u1yv
	 JB6nhYcTCnoIi5J+s+oy/ZFBHKs+CK0y01T8SjWjOT8P1Q0q5q31NpM0j5E/X7v3g9zXb
	 XMyRksqHqLAVPVyfzLUJWu9v2DauyVU8cMo8fDULb81+Ym+DTMpWZOLvjaBixpMqgSja4
	 FFtIPdViJ9Avv/HE/Pn45AonQGpuHcZMka0ELrYcm6OBmR/w90006IszO7XYuGmojkUtZ
	 /WCHkm5WECu5auQPRLzCI7ndX+GiNHsyAN5ajC/nzaKbeZf9BSdSdNruDDPaTx4wy8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0fedjRZx;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7E2606A33E
	for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 21:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B7E2606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0fedjRZx
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1991412f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 13:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795468662; x=1796073462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEI2MWJHKjiB6vj3bpQygFD6VsBJJyxeJ4zAlBvCIuE=;
        b=0fedjRZx2RaPeNewDfT6kMMnjXVPl/B3fA1gPsEqLujR7kcW0NYtdJYVaByQandrUq
         QJzBJ4uC9eS8a+ayksMogNxSExWs0eNFKItvTDKAx6NHc5x9hqv9RQlhAAzaAg7s5gs1
         9sbtbyps4kPCKude8iZa2iiFH+utWXTUN8TCJqFX8mRmvPPMu6I8nAQcyMZ4i4mpzyX5
         Cp154EF42lPno5OVkcDwnkP37Yni0BUszr0xLEoRsNB5R9GRF4fxmXOCy5ua5f8Nqhrg
         4AybiECJ+X7fZBXujwbzZQ4s2TiblfJ29wOS+plEAwzRWxdPuG712xtYts3o3CIOU5fN
         1RVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795468662; x=1796073462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mEI2MWJHKjiB6vj3bpQygFD6VsBJJyxeJ4zAlBvCIuE=;
        b=bmZ8empiRpqS5TwKxm3tUg4I5QNta8b1Ptcs8ohSfaZckWT7DrYp0lDugcYa3401h6
         fJQa77AVXH1HLc51IW1AMNWc9FtzvMQ+GnOcj64vk9B2kWpU9hrVeWnHHG+ZrexivIkQ
         ENfcSl10Lvc7auZRCjqquy1JJnTScuapNzgzNFIdmC4MI8/IInHb/b/UIM+bPs+Wlbeu
         AriEQEWAHtIFRHcBoCiuJzNq7xWJwkXcwgXtD5dJWOHcIc+TNGC+P0asyOYBgnonj1Pj
         POvGLVh5fEdJukgck89mHH12EG28pTVaUcAkiBxgJHWDGwl0KHoxFhq45hk/dk+TOu/C
         it/g==
X-Forwarded-Encrypted: i=1; AL+hErEsgXASHEEReIYeG1UPBfm1X3sZ1gqpPXxeQSBzzG5WKw7Hti6hOkFAU86sgWeVAUxDKG2paAQBCqc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8494GH4XnwwnvHk2cAskxBAKTr0+Lgp/DKQabrvJgNb4tsjgo
	1pkZc87gjcO6/rVE3PqxSkgxfj2Q9wVsBaBDW4bGuRB86dkbrIKhr48f
X-Gm-Gg: AZFdTZdvHOET6yvinay0tXGw8K2E0l3kmxmliB1wFKwXpDg49WdLfnBPZNKuv7eMj5m
	GSg6zmcBjyuEbDT7vG74kY9saitbBmMi6Ly/ig/VOog17O4CRfRDV/6og82r9aCaenxmgLphZXy
	0CMQaZbbJNEwyQoEmAy/eF+ZnnGpWmMBiiqkNG9HSy7N8ark+f1BAPzJqvqoR3ebtRD3ZGSQ4BE
	9O87YwumMeep4ZW1qlj1gY7AjddmzP0dzYPcumcoydXb+NvxBduB/lC3KoLYeMkxP/nlaQS6Gob
	T9VoeFsUWPvWqbWLgCp4t5lLAhrjDMDyVlWbwhGIDKbXHQj7M+6AstcMsFIKXsuApiAAQ3HsuFv
	ln18CE5oRVMtSX6/WJSdsWkhb5C1qhGPqr6pe7bTGSgEKU89oSWeu14pWUqAKPMhuUQ+9Xr400+
	1/f7cbvVFd/bEaPwc9waXMOCrSH8psf6fdHba/nlKSveK1xDLhVG/GmD5sCfxStZIHw0Y1i9jlE
	PQwcITYW7zqMQtpPyC+IPswZ73j+CjIPYbuxgpChaXgmxvFD++YHAT6Dm+RWERyENcCWZaZBMqG
	1gnjbssyalFzM/zo85oj6XpA97SzLOFdvwWlsqRkmt88sNOQ
X-Received: by 2002:a5d:4605:0:b0:4a4:14db:2348 with SMTP id ffacd0b85a97d-4abb29105d1mr18698069f8f.35.1795468661504;
        Mon, 23 Nov 2026 13:17:41 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2e6dsm24513121f8f.6.2026.11.23.13.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 13:17:40 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Lee Jones <lee@kernel.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 13/16] dt-bindings: arm: qcom,ids: Add SoC ID for SXR2250P
Date: Mon, 23 Nov 2026 21:17:23 +0000
Message-ID: <20261123211723.1065310-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261123-pastel-barracuda-of-rain-bce8ac@quoll>
References: <20261116-halliday-dts-v2-0-2c92438c6c46@gmail.com> <20261116-halliday-dts-v2-13-2c92438c6c46@gmail.com> <20261123-pastel-barracuda-of-rain-bce8ac@quoll>
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

On Mon, Nov 23, 2026 at 01:09:26PM +0100, Krzysztof Kozlowski wrote:
> This should be rebased on my patch removing the IDs.

Thanks for review. I will rebase it, but I am not sure about
the order, could you please clarify?

1. Should I wait for sending v3 until your patch is applied?
or
2. Should I apply your patch locally and then send v3 based on it?
(but if something changes in your patch a v4 might be needed)

Best regards,
Stanislav
