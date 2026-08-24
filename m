Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306887E105;
	Tue, 25 Aug 2026 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651277; cv=none; b=IjayPoFG41PRP7p95CaOT2XmvVhBIyeZ6RC58toMpDZoEMDRUehTivhZiJrygHiPEmOVFlCzKxxvx/I+MEXxpnZloSjK/SdFGmH3cw6adHk8J8VQ8sCvbR+bFcWvU/qzV4RJqjBvvQZe3r8vluVmzIKCLN3ziKmnDV7M6+xrB7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651277; c=relaxed/simple;
	bh=g0J/1MS8UMzUAxeUaFyl1gUC0Pk1ruRRb6ovv6hPxQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FEE5T/nrpkzfH8BY3U7G/jT7igmr6NdMieJqI+uD6tidriKY0MSg0rm3Ds78o5Zr9mNU6EqHNsHrKHmsbS9tYupFEoemRB2w3t8pI8+70rJHlM2PH/KVbUpYdEoUdxhyQNfuWuwNf5L2X3/hnHVP2GGmUg9sagtBTZJZpdb+PLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=FJ86VyC1; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="FJ86VyC1"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 441FE11C187;
	Tue, 25 Aug 2026 11:47:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787651270;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=5JNIKTk99mqX00p9EnKMWbWpSfVVLgeAoJqGdZVoMMw=;
	b=FJ86VyC1TPOUb77sWpRnoea6tlZBvYmblAYhnllz8Flz1PEpParjwdM16bQAIXKkT7GAkE
	XXDix7PGuR/qBJhFMIhY6COUahTYhjlA/q9ZvV8S+c/RmKCynKgaRqn1S3gics8Bk1o2nP
	vcD6YyZxSLj7lQM3AIK7kxQF5UkGtCo/I3tiT/uye7RMic5eWiGzwFjPAmbsPP0G3CvwJg
	WivJduJcOmrUVPQS9ErUNzPJzedQmhf4RQIgVsD/PI8R0I3+pAXYwosQ1IFYksCVc7RN01
	J83hjGHVA3k+nX6YqbtmsCFB7qhuuEczTZTg+3E7yaA1Fivmi8/BqJOQoWr9qw==
Message-ID: <ad353c4d-c6c8-4ff1-993f-e50b156a4401@nabladev.com>
Date: Mon, 24 Aug 2026 16:53:23 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-3-marex@nabladev.com>
 <b470667d-6a15-4eb1-9332-07f25f069b3f@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <b470667d-6a15-4eb1-9332-07f25f069b3f@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/24/26 3:17 PM, Fabrice Gasnier wrote:

[...]

Hello Fabrice,

>> +static int stm32_usb2phy1_init(struct phy *phy)
> 
> Hello Marek,
> 
> Could same init routine may be used for both PHYs ?
> See below comment.
> 
>> +{
>> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
>> +	int ret;
>> +
>> +	ret = stm32_usb2phy_enable(phy_dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	phy_dev->is_init = true;
>> +
>> +	return 0;
>> +}
>> +
>> +static int stm32_usb2phy2_init(struct phy *phy)
>> +{
>> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
>> +	int ret;
>> +
>> +	ret = stm32_usb2phy_enable(phy_dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (phy_dev->mode != PHY_MODE_INVALID) {
> 
> The only difference is here. On the PHY#1 the mode should never change
> e.g. mode == PHY_MODE_INVALID. So same routine may be used for both PHYs ?

Since there are separate ops for each PHY, I opted for avoiding this 
conditional on a PHY where the conditional makes no sense, hence the two 
separate init functions.

>> +		ret = stm32_usb2phy_set_mode(phy, phy_dev->mode, USB_ROLE_NONE);
>> +		if (ret) {
>> +			stm32_usb2phy_disable(phy_dev);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	phy_dev->is_init = true;
>> +
>> +	return 0;
>> +}
[...]
