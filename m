Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994B6175A64
	for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 07:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773992791; cv=none; b=MgaN9XsJPzMJzB/21MAx1pn8dOrwyEYxnOmLJelb2w0KO5tvJzfB6eMboFilRcAv3g39vWMO96YwV5DEj4U8Vg7CGt1mM4+LREmM5rKg2SQXAtpj/rO+7/uMCVPXItM99clNgI/d8T/zFxe1852KkMxl452+5W5Fr3ucJMN6yTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773992791; c=relaxed/simple;
	bh=xpMLAOZvhEkRytV+fa+rQ9qyVsW7tLTtfEbuNXc7Mh0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Uq3nUAm8ljj1SnkCQeeWC9ZOssjQT4ppiwO2MF2ci6IUAj54mEepIG5GUM0xFPiwGuBd0Oh84nNbsHAtbwKtJnLREbruOGyUwmD/apG+4qADF3jxupp+E04qar4mXQQPlI7ikiXN/ICLQJ5c7gT9Te8HASXztmMv0lAFLow4aks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cuId0NRl; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cuId0NRl"
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773992778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xpMLAOZvhEkRytV+fa+rQ9qyVsW7tLTtfEbuNXc7Mh0=;
	b=cuId0NRlWcRCWES4HU+Lc0ibv221MW3lWyOOSu7k/bwBjgd6QZ39zqgGbVZbJJ35e4WLsi
	ivNw38ZPjVePckXTnkAQjc1bCiwMpGJ3HUWyE35Nio1vJntwQpAvjhLXhu7qIOjQjyIG0A
	22Zoytt9cfpinC0/jvLWb2yWP4He7zQ=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 15:45:20 +0800
Message-Id: <DH7FXPBMB1K5.28IT6DZQ280ZV@linux.dev>
Cc: <dlan@kernel.org>, <gregkh@linuxfoundation.org>, <huang.ze@linux.dev>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-usb@vger.kernel.org>, <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/1] usb: dwc3: dwc3-generic-plat: Add optional VBUS
 regulator support
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <huang.ze@linux.dev>
To: "Chukun Pan" <amadeus@jmu.edu.cn>, <thinh.nguyen@synopsys.com>
References: <20260319214633.cyzr7silffbzisot@synopsys.com>
 <20260320063621.1204038-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260320063621.1204038-1-amadeus@jmu.edu.cn>
X-Migadu-Flow: FLOW_OUT

On Fri Mar 20, 2026 at 2:36 PM CST, Chukun Pan wrote:
> Hi,
>
>> In my previous response, I noted to pass the name/id that best match
>> your platform in the dwc3_generic_config. This structure is passed as
>> private data corresponding to your k1 platform compatible string. That
>> should solve the naming issue (i.e. you can keep the name "vbus").
>
> Thank you for your suggestion, I will change it to match compatible.
>
>> > Do I need to check if it's in host mode?
>>
>> Is your k1 a DRD controller, and that it can operate in device mode?
>> If so, does it save power to disable the regulator while operating in
>> device mode?
>
> It is a DRD controller that supports switching between Host and Device
> modes. I will change it to enable regulator only in Host mode.
>
>> > > Also do we want to disable the regulator on system suspend? If so,
>> > > we may need a regulator handle.
>> >=20
>> > I'll add it if you think it's necessary.
>> >
>> Same comment as above, but this will be more involved. E.g. you may only
>> want to disable the vbus when remote wakeup is disabled and power saving
>> is more essential (disabling vbus will disconnect the device).
>
> I will consider implementing it in the future.
>
> Thanks,
> Chukun

Hi Chukun,

I don't think it's a good idea to tie this optional VBUS regulator
implementation to the SpacemiT K1 platform.

While the K1 SoC does have a DRD controller, current boards in the wild
(like Jupiter[1], OrangePi RV2[2], and Banana Pi F3[3]) all route this
port to an onboard hub[4][5]. IMHO, managing the downstream VBUS regulator
via the onboard_usb_dev driver is the correct approach for us.

[1] https://github.com/milkv-jupiter/jupiter-files/blob/main/hardware/v1_0/=
jupiter-sch-v1_0.pdf (page 20)
[2] https://drive.google.com/drive/folders/1pcI_U0C3VJKTCg8A1zj08CwNbohnONS=
R (page 16)
[3] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view =
(page 24)
[4] https://www.lcsc.com/datasheet/C209756.pdf
[5] https://www.lcsc.com/datasheet/C157362.pdf

K1 platform currently does not need this feature here.

Considering the role switch, I think it would be better to hold off on this
until there is an actual board/user that relies on it.

Thanks,
Ze
