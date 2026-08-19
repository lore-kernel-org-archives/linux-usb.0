Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D64480326;
	Wed, 19 Aug 2026 15:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154312; cv=none; b=A85cNOBEPaHVT/+J2ibRvc/LFOpdvP+yvQjsRZePfJ9GlLFeRtGzw9J56SD2R4s8cvRPhQaZlI+R7fbPsx90IvPE8QaNnBMCfZ6falhXG9aUX+s1Uyi5qg52IZgKrDCccJeIC0aqF/Xxp9wih5Gnp2eFrkCcjYJX+HkdSB7+GGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154312; c=relaxed/simple;
	bh=bCFKEMuDZ6PIZowuuX/q/WWHi4ME0aIDO7xxYV+ZL68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W/cdSZLSytHuGSa5fLEBnE4KDEYQhTBjYO4F5J4VNEAMM8owMyylYuRWxRNE1ejyhAjxxvZgdjYXsPew7Oymq5fdxChqOpx1tuYIdUGPfebOXRJaLXUxUBIQxJWErBKs2b5nqSIq+IIqYfeo0ObzjZo8HmxR+F6DkFDm5jAyAGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=ZguuqLgG; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="ZguuqLgG"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6620911A40D;
	Wed, 19 Aug 2026 17:44:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787154301;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=jKrds4Vj9VpxWlbeCohHZvmSocW530LXUZIAJ3ynTZw=;
	b=ZguuqLgG498/pjMsosn7OaBTD9B1+NF5ZsweITOEhJ4AJduSLZ2b3PMnCGUys3m+qOziXb
	Vya4pIYMGVkAp2d5P1j1R942XY9FmvGh/clUY+zwgepGVFVNh8hLJCCFuFbHxf2sH3c9qu
	LBo0VDhWdSaU1e+sM0tR6VB+qqrYwK6dSsDwmeaHcYYYnnEu2k5HfbFbXZ3P89LNCVNxfE
	uVRF7DCqv3g899nR56jDa+gFcJyw/gvcaUJDrvUPgTL0EG9wvW6k6Ts0Wl8DVQaBRLpg8Q
	Ey1Ny+HxFcVT2ckiCcnpK7xcQAAdoTDKNUqXn8ya3hN0hCR0fmDhUZBmH1nR8g==
Message-ID: <23091037-bfeb-46ac-b17d-8b86394b119e@nabladev.com>
Date: Wed, 19 Aug 2026 17:44:56 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] arm64: dts: phy: st: usb: Add STM32MP2 USB support
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-usb@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>,
 Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260816213849.1044073-1-marex@nabladev.com>
 <61dc785c-bea1-4674-918d-0f38ea253a29@foss.st.com>
 <41e7978b-933d-4813-9158-00474f531476@nabladev.com>
 <6c900e6b-2f50-4ec2-aca4-3093479bba53@foss.st.com>
 <d6064380-2368-4131-8cde-44734f67028f@nabladev.com>
 <066ce020-6123-4aed-a069-67c51957173d@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <066ce020-6123-4aed-a069-67c51957173d@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/19/26 5:19 PM, Fabrice Gasnier wrote:

Hello Fabrice,

>> Maybe the DT syscfg node shouldn't be a plain syscon , but rather there
>> should be an actual driver which binds to the syscfg DT node and
>> configures all these hardware details early on boot ? The USB controller
>> drivers will start only later, when the syscfg configuration is already
>> set in the hardware by this (future) driver, since they depend on the
>> syscfg node and the PHY subnodes. Maybe that is the way to fix the MP21
>> without having USB controller glue ?
> 
> Hello Marek,
> 
> Ok, I'll think more about it regarding MP21. Let's continue on current
> series without any additional glue driver for MP23/25.
There is really no rush, if you can come up with something for MP21 that 
does not require the controller glue, that would be real nice.

Thank you for your help !
