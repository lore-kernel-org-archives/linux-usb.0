Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214238;
	b=SRsxMnbceZ2zgxxy4bnoEu+T9tfyzrkC0gmGJKKfToHVIytUMDloaaVCZ9e/N+f5sRIw
	 4Hf6J1JRNnayXRt5OWjtcyBbPGJnWda0LHFZH5kQXJ7UdYWzzwKq/VOtfmCR/XgCMgBaL
	 71XAB5juGR1m56U+nzMy6PFeAmjq9LBDzplSv0JzsaTtGKu3erSAQdX5LYOYMsuYoTxFz
	 7mTGiFUatFWlbR5EVqfE9fzKNKUw1inWbvOfo9dFam04/7bZ58PhANS+lIIIkSRAc39cN
	 WAKVeGHqf+i53Xu/D4u5Vj6SLU/5JuY7P3ONJakbUKzs+g9ca/t825UuGk71LPM9N4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vjj4rdSbpcMkkjnNoByhSOYk/2BEXBPon42q9R20zeY=;
	b=ZpS70YkyCUdhvxf2EXEbgy6sohhIZPayj3X4WlVfxDYmVn746/Fc2ERdvPg33oGWelBG
	 wuJnRcHGAeYhzIqqfMu7EKplHwv+pAIHPuSdAhVWG+SIPW0uZ1yuCCMb3ED5jK+kma2uM
	 4JNnbBqiIgaxzFV6vVfV5kXZSAluxImnbCsdWquq6D+mG5RIHZknFllg1Nfz7f0oIHn+r
	 TWIl7fWvXfAIFyPaqjHCPVaBzznxHXvYvUxpGBBmXllY4TZU5jVBq0feleUleOGg1B150
	 YocMR5z4QCzFglMVrgSvv76TQAiCNhyvtWS6UtdsAXWTXReOaGfI5M2nXzdeH6z8e/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGqde3Ho;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE4B606A31C
	for <linux-usb@vger.kernel.org>; Mon,  9 Nov 2026 08:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE4B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TGqde3Ho
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso3673335e9.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Nov 2026 00:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794214236; x=1794819036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vjj4rdSbpcMkkjnNoByhSOYk/2BEXBPon42q9R20zeY=;
        b=TGqde3Hoeoi+P+P1MJHy6yFa7TDuVfP4g4ZGwX2ih4xjRGjRFWnypRzOP1Xa4L0IPm
         s/DPVbSTnEn6+vQabgyMvzXoPqHofh2/mImSCnYL5a12zXk5bVCjZsmkY8NnMPUi2SVc
         xAgwi/orvf9pFkFiAXO532yOUQEFgNvW8m3sxgUIowoBqxTIMXeJ2WTdj1dQHwKMPf0V
         cCNQoCDDyIF0nns6PDu+LZixogYHFd2CbQ0mtJSAP17FhsmRFJQnz4kJM2w5Emebd5cL
         Ug3ZqCYI9cMwu6iJ7WzAlyerv17zrvmPyC1IUPu31nRNXyg9pX/XYW5Pjf8n++ZvU2Ya
         pTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214236; x=1794819036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vjj4rdSbpcMkkjnNoByhSOYk/2BEXBPon42q9R20zeY=;
        b=CofO338wEEsZa4/attOxpboEmvtW0hVInxJmc7TCgl8N9RhI0C1iDJRPwmMZrEsDA3
         Qg31NnF78NSWOaATyks7sQJIsWf5fyvCk4bysyzYxl3mST91pFS6ZOXjrsF+m0PnpHcK
         bd7BMRDY9FhESWirXt6WqrVt4mrhn5YKDlJqKS4vX24F7hQt0J8Ej/FrFoATPNhzO5h8
         93Ye2DKySvuUbdiAq3TYlaF6/H9eUbDIgSR4aKLV5AWAN+uyy6s/+9DlZF+Ujfg7sqL9
         kkUhvgeBNwZ5dmNqzn6Qhuq7hWizClVs7iMlPc5q652PU4gdS+R+/4WrYEfSluxBBu96
         dFHg==
X-Forwarded-Encrypted: i=1; AL+hErG4uLj50RUSHjeg00x6eMcBYk1OOf1eihsI0Jd1fkK1ZdFGaUS4UKronTi9fqqugBM8NlhvFQf3ELY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NJyopnbs0C+PpsstofLMTgnDWG/UnFYmtbthbzS1xkOfKC/RS
	WYCH1TXumN5VOqxH76+RTiKdYDGYqAgnViAB+Dg753BAuSjJMf2Gc3DE
X-Gm-Gg: AYBFou34eCn6WzFvrkFP5WbsrwKzv5OcF77AUXSoYMiDCwwhmSaiXZS3U9h+UY6eEOQ
	0BK8++KG1SNv8Z9d6GXyNZNOTaLFyJxRn9hdYqDSFgBw5LSVMXf3T23KizqyC4HQdp3E6g/MgKE
	vPmovF/YR6HrhiEf084V518/1RnZcSxNLI5Gz7nZXX4zpD3ZpXeYSf22PNMzNtk3CK/MOwNs8Mn
	FK8V7LBzAeaHUSa2XaVp8nW5Sm+VTEnnydAtsxzgRmKAYTS9qvTxzchJmwZMZgpICTH9y/o+PWI
	HN3nguaEYddTM7Ewaaet5vRTUX6a21+YGqf9C4fKfm/9aXjAdonJk9V8kDE/m3te7BK7CKgsdo8
	TzjXQEzmhSQLKpEodU9k/atJnZuQOoUMT5QyKpI8o2NyPJklf7f0oaLHI84rZjcwRvEVxJglUdY
	kIs4ijyiqTKcDl3JEbp7CeTAy/C2s13SYCp9S8X5BQnnQGjPxKOZzlzBPTtszRJPq6mQ5Dmr+Ye
	v6VRRmQI33lEEQIh611CjiELu5QA8ZlE5FqqFIou7E4u6ayXn7s3iIbpkHKIaECaVuPvZYZYyau
	Ka1X/aMNVbDhIoUrgg6DtHHXFaE=
X-Received: by 2002:a05:600c:3b1a:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4b963c7e496mr65389125e9.29.1794214235848;
        Mon, 09 Nov 2026 00:50:35 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502d5b1sm147015055e9.5.2026.11.09.00.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:50:35 -0800 (PST)
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
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 16/17] arm64: dts: qcom: Add initial Halliday dtsi
Date: Mon,  9 Nov 2026 08:50:19 +0000
Message-ID: <20261109085019.1751534-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9dbfc665-089c-45f7-bca2-74caee322885@kernel.org>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com> <20261109-halliday-dts-v1-16-289114ab8197@gmail.com> <9dbfc665-089c-45f7-bca2-74caee322885@kernel.org>
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

On 09/11/2026 09:29, Krzysztof Kozlowski wrote:
> Odd license, suggests you copied it.
>
> You should retain original copyrights as well.

The license is BSD-3-Clause because I used sm8550.dtsi as the template
for the node layout. The values come from Qualcomm's downstream
anorak.dtsi, which has no license or copyright header. v2 will add the
Linaro copyright from sm8550.dtsi. I'll fix the other comments in v2
too.

Stanislav
