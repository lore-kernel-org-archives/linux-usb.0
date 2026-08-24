Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70997E105;
	Tue, 25 Aug 2026 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787651272; cv=none; b=aUZIGjFlPYFs2cZTBCKAJhSADTFYAN1FKU59RgJd+l8x78tvGM4Rv7mFpScttO1OWVflJtrd2D5DrpWM6pTbeLgqV1VUGaL4s48zHld2WqmZq93dSAOpb+MvkMTJ4zZsGzTR7kRw2y+GYG1/OzHJ/69mGtUh+rqrm+m8dp0IlNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787651272; c=relaxed/simple;
	bh=rVquEMg6mWXymIiFXgz3gWp61VjkCdJE1Sm+Y1QNtpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fz6zRdc1rQNWczsd1pEFA3+fmk1QpfdQXDJcJlZHKUANVqxAOQMRLRXNf1bAO98JNwVtvVIoHBLKt3Ft5vTK9+FKQtsYn5K+IufYWj1GoUwNyRij/VC5GwGisaiNZX7Qn2co0U6BGiga4cbSXWN0pcAeVBL4rwpgyzfnm0dyLMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=KSLTrG1d; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="KSLTrG1d"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8CBE11CC55;
	Tue, 25 Aug 2026 11:47:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787651264;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=GyJOErG3s8GlSEmj+9LyhK1ZcgZmzhmpH3gk6EXWH0U=;
	b=KSLTrG1dU4maTkSkUQiq2JibZnDH/0QxNj8Uu69yr7yFNL4d5RS85XbpkaSOGORSrbB7rg
	wOPKHZkS64J8shLg8G/ufZydU4//HEJp0Kt9vap6n9etisepHzTlFDblvKElq430UTzZqk
	Vi7YAEuXvt1jVGUOQvzOoFWkW7kkYIbJuwqkmIedLc8e9VQUCddojhbbEB/t6EOUwYinTN
	0yvZqM3k/S7cNt43oSs2g/khqoPq3hZ10EVTO2WuSbDNvotgPu8Pc7mPLg9D1d3EVegRR+
	s5AaFfBhNxFuhpX301hvH8gOeWkmWbN41hzQoMrcsO16i7S+dZ7iDNtYamoJkA==
Message-ID: <68145a72-d543-4e94-af27-cba6b620c13d@nabladev.com>
Date: Mon, 24 Aug 2026 16:39:49 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 9/9] arm64: dts: st: Add USB nodes on stm32mp251
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Pankaj Dev <pankaj.dev@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-10-marex@nabladev.com>
 <a6c55491-7cbe-4856-bb45-b7f5872966fc@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <a6c55491-7cbe-4856-bb45-b7f5872966fc@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/24/26 3:19 PM, Fabrice Gasnier wrote:

Hello Fabrice,

>> +			usb2_phy2: phy@2800 {
>> +				compatible = "st,stm32mp25-usb2phy2";
>> +				reg = <0x2800 0xc>;
> 
> Hello Marek,
> 
> Similar to stm32mp231: should update size ?
> 
> 				reg = <0x2800 0x10>;
Fixed in V4, thanks !
