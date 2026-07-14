Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46853FAE0C
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017616; cv=none; b=b9ZUqG/gOE0XG+VCxa2/I39ahI70wgxv0uOYte4zY4n8IGtGrZ4plGUyVqq0GRTGrc1TQN4xUzYJhFQbFcWXuFQ87arWHW9yE7vpb/qaAmxOjn6ueAoTQ2pLwcDnCJh4lyvHwO2t+IgfGO6ujhpynUzg/VQ2L/kdaByIBJM5G74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017616; c=relaxed/simple;
	bh=Pc4VB1+Ef6bvrAi1wEOfOEDmY36YwvKLAzSlaQGE4RU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p5SqYGMMngShwxvOqF6nBJKXttE05m1SDqJNj/JYjgLKmBjrTcTtdNWN/L6NKm8dwRqo6ceSib+IVJeaFMRom/MQ8YNrbb74A3y7YDX3BHCwWgeJ6g2HSKBKyGYFJrFl6bkvQJMrnAp/iFsdgwenC297ibqVPpXDPcdTYUzyywA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DDc2iS6Z; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDc2iS6Z"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so5414121a12.2
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 01:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784017608; x=1784622408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2cBb0PIK05nLQLX8d8JBI3hyZwFcNaF0BlltgJKRbuY=;
        b=DDc2iS6ZaDSjQz0XA8xSbLZRrsQoRr0n43jeDbgg4jzkify8WnZkE+XEwGt5CdFtM7
         WjOrvyYJcrU2rsXTX0/VpYXiOWfI/Heez9q7P4qhKeiCdQC+RAR4X2PDOq90tAYET1ZL
         yHiQVJE6ddgeYHm7ZoainVwLUD4i1f9JiOHlDmR/ErO0mH6gNd2r//x6W+Hd0nB9GZQt
         O0xjnViYK9zm3dE5KNk9z2AfgoSeg9g4N2PqzSJJvsn82Yw0BSe8B6tNZ575B4QW3Vzc
         sw2uYMFrsEF12t/i5X1g49lHsy+sp0Beu//hWjFgXLf1Q+b0+K10q0QGRayg/5kj78xu
         vwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784017608; x=1784622408;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2cBb0PIK05nLQLX8d8JBI3hyZwFcNaF0BlltgJKRbuY=;
        b=GXOSnKaz9EprMu8l8okbPp5yQo0afdhDAGYbYZT7oEW75D3plOeLzpR4GUCDV3aMbP
         GVsHZ+Mc6M7XCT8K8GUPrwyoHVnFwEH9VGGMCouQGkEWLRR7BsYknSg3XQwrvOeYe4aE
         T4LUUJyZ2PXoL3j50ba52PQW+rg0CzyJnjOKptd6+AR8gpLEDqnpvZA95i5vlqeZeykK
         X6CHpX3K2oxwSkx6H10Hi25iOy4A47is5Zx4JCsoYFFinHYfdZG9qflg1jPMPhQc36Tf
         w66T/GjJaRvWiNUcoxJr9AaWEMtCb4zOThBaoyuPFltt/TidvO0OCEFLglfU/PPqQQdY
         0lGA==
X-Forwarded-Encrypted: i=1; AHgh+Rp5dUgb2MtTkBFbjyj6xxJ9L0bixP+Fl51F/YUsWZ0L72+RV26VYCiex+uDdZQOPNcAQIXdPFSNk7w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7XjULay9SbkgQMyYhHDCUzCMGrCxlC1tuPXXz6/RPrf/bWkAt
	C4jPsEYTnGk8Hi94egsh1ON3YozBRvF7tKeciqaKOB3lfuifhqs7XjGi8mpFG2sISrQ=
X-Gm-Gg: AfdE7cn9LHzd1lA0cq/MIJ0BOMxzY2A7yoeBL+Z2/p9KjlNlLeRVxX3d45TDE+Rsrw6
	gcIdaDMYmjrx5mpOOOgROMdvTbQumJTg1rvKAr9aEvJyzuht60sowYfnJoPbQnh1R1B7SivDYK2
	hD01DwL2igOp92+64HBNZpGIfTBo1WNswcuItKmrqJ1bWoQbu9zfbfLNWVikRVescxvCOqngaFy
	rzBxPSes8OmS1eiKks0AGEOTC4G1eqzRbhthzRaItX/m5yeROTCfXX6ol8it7TOlENdojsPTxuq
	P2npoQZLY8MKxQHH5YwjB4svnaikB2tl+pAQV3gpKDNQYsiOHFzXMCZ7iE/cTE+dXPhOtjKZ48h
	sGNMWP63V4ayJO3BuW5vVB0fSHmDHLE3EXw70y8FLsTx5RYFFWvtkJihK30ia1XUav1w6oqxfPX
	2E88RBgBu4sSju7VefAgd8BUXiM6NpW80FpX57
X-Received: by 2002:a05:6402:3513:b0:698:b899:d1 with SMTP id 4fb4d7f45d1cf-69cd6c0cc84mr541837a12.0.1784017607422;
        Tue, 14 Jul 2026 01:26:47 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.117.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd28a298asm972902a12.13.2026.07.14.01.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:26:46 -0700 (PDT)
Message-ID: <3c8c0777-99e3-4dd1-b235-f3d32643efca@linaro.org>
Date: Tue, 14 Jul 2026 09:26:45 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] usb: typec: tcpm: qcom: initialize currsrc explicitly
To: "Alexey V. Vissarionov" <gremlin@altlinux.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Casey Connolly <casey.connolly@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, lvc-project@linuxtesting.org
References: <O53N7pugg1-s76jrwoKAhbBDXR8MpaQcpeBZ-yXGvX_N496X72YHCZC4tzar29CKo0MGFft9Ctcq-p5za2l7cg==@protonmail.internalid>
 <20260713182500.GB22956@altlinux.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260713182500.GB22956@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/07/2026 19:25, Alexey V. Vissarionov wrote:
> When regmap_read() fails, the execution goes to done: label, where
> currsrc is passed to rp_sel_to_name() and used as an index after a
> proper check. However, to make this situation easier to notice, an
> explicit initialization of currsrc with obviously impossible value
> is suggested. Alas, we can't simply use zero value here because it
> means TYPEC_SRC_RP_SEL_80UA.
> 
> Found by ALT Linux Team (altlinux.org) and Linux Verification Center
> (linuxtesting.org) using SVACE.
> 
> Signed-off-by: Alexey V. Vissarionov <gremlin@altlinux.org>
> ---
>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> index bf985efe1cd6bea4..d7cb69cf6044841b 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
> @@ -461,8 +461,8 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
>   	struct pmic_typec *tcpm = tcpc_to_tcpm(tcpc);
>   	struct pmic_typec_port *pmic_typec_port = tcpm->pmic_typec_port;
>   	struct device *dev = pmic_typec_port->dev;
> -	unsigned int mode, currsrc;
> -	unsigned int misc;
> +	unsigned int currsrc = 0xFF; /* error, easy to notice in the log */
> +	unsigned int mode, misc;
>   	unsigned long flags;
>   	int ret;
> 
> 
> 
> --
> Alexey V. Vissarionov
> gremlin ПРИ altlinux ТЧК org; +vii-cmiii-ccxxix-lxxix-xlii
> GPG: 0D92F19E1C0DC36E27F61A29CD17E2B43D879005 @ hkp://keys.gnupg.net
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
