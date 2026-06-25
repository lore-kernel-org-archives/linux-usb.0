Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED783E8337
	for <linux-usb@vger.kernel.org>; Thu, 25 Jun 2026 15:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782400962; cv=none; b=tcHuRGGqYn+t+S0MizPz4WkJ8zmaoSWoxnKKo0pTXIvs5V+kik3s0LBmJG8hiMpcscrf63Pc4H2TNmAgiCHES1x7hXtgZ/V1LUMBouUBp8k8jBuP+slS8L5ywlCDC62tl5F3CkhykM80uk8Fk70cxrAf2QeolJRCaLcKVkIAWA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782400962; c=relaxed/simple;
	bh=whoMTGy5Gn6yTvZ46KobqY5LvUrbBB2EvXc4Z6jWOiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iiI0JdAGBWSE1AP4x6vRgCBK4YRadFyTNFW90HWniTt1qUrIWqcFUCyO5uhYusJUtU7bk/8aF2Z3QFS+kM9IBb+1O+pGgRmLDeGJNKiwa550cZzrWfogeh0DTxx5pziBWReCySV4VcNPkWfVY6EcO8HXUMZDY/xal+Lb8loTn0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=lw4xdu8/; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="lw4xdu8/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1782400941; x=1783005741; i=wahrenst@gmx.net;
	bh=OfIIZoZ6aRZtwvp9QU10WtDeRN8giVJPhGYrpU7Zock=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lw4xdu8/oTo4TKkxIJChbIMXQxnxm0rVNYP9oPxBooweFgZhgA1A7W75qC4gyHi6
	 RILBm8JEzQiQyvPsoGAm7Zte+3gJqtFun3CSL87hjOxuGTq6PkRJFPxNa0nH2kNYR
	 B4YT9aQGJbiwbKPBy8qmVx5ayIFnHbpgC8+t1CE/WjN4ueGRRFcO+J4eSXBklgVDe
	 ZCPUjTrGgj/Jz/iFYsEX/U74qT7IxlNh9GBlVgyJpXS5Kdzh5HbsK7bmrIQliTsqu
	 iS6SUjoMUX69284RqKb4jqClon0tjRR5LskxXk7gFN1/vo+Q6HyxZkCheOjBd5ZY3
	 v/lZvbQk+KYoxrN+cQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzhjF-1xOyiK11zF-00yFXs; Thu, 25
 Jun 2026 17:22:21 +0200
Message-ID: <f1cb93cc-40ac-4b88-bc0e-94390d1f6a99@gmx.net>
Date: Thu, 25 Jun 2026 17:22:20 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: chipidea: usbmisc_imx: i.MX93 support
To: Xu Yang <xu.yang_2@oss.nxp.com>
Cc: Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Jun Li <jun.li@nxp.com>, Alexander Stein <alexander.stein@ew.tq-group.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <b2fb88eb-5c5f-499f-9cee-6a69769c578c@gmx.net>
 <ibkjg6bymxoy5wcewrfn4y63f5izlh2yvdqjt42a63kvttr42w@tvqjjhfjg3u4>
 <40e4df43-5de8-48fb-9c5d-9ccb437e63b9@gmx.net>
 <lwo7rsdsfuibceyz5qoi46bbrhmofjpb2e3ukzdawieou3uo7m@5o2ral3q4oaf>
 <07bc94cf-2b89-45ce-b36e-d07af6749ef9@gmx.net>
 <sbu2axah6vjys2q5zpsurdzlto33zbcpexmfn7uhpnxzkmnmle@3dl2jvt4hb5t>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <sbu2axah6vjys2q5zpsurdzlto33zbcpexmfn7uhpnxzkmnmle@3dl2jvt4hb5t>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:85gvq/Ur91um3LfXscEDwOVKuWjvekchD9WRcbvhy/dwq63CHhD
 hik/sLY7GJg4ZfsY/VUm48i9BEDHYogKSob2PtCFpXBnPoMbDD8j9j1JtjYaadN4s7qp8Vx
 DwXtywJ3bYpsYpePABSyiAKyU2SCO4I4HGeyBYb7Eail7gTP8TagmFjdtHs7muVhlefYXbT
 fcuxj6DR19f1EeDwMcshw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RectuR6Bnqg=;wa5EQOymHMMX8796D47C2NWkIir
 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

Am 25.06.26 um 05:07 schrieb Xu Yang:
> On Wed, Jun 24, 2026 at 12:05:00PM +0200, Stefan Wahren wrote:
>> Hi Xu,
>>
>> Am 24.06.26 um 11:11 schrieb Xu Yang:
>>> On Wed, Jun 24, 2026 at 08:30:00AM +0200, Stefan Wahren wrote:
>>> What's your issue on i.MX93?
>> we have an i.MX93 board using both USB interfaces:
>>
>> USB1:
>> - external available via USB-C connector
>> - OTG interface should be able to switch between host and peripheral
>> - as USB-C interface control we use the TI TUSB321AI [1] (while its DIR=
,
>> OUT1, OUT2, CURRENT_MODE, PORT is unconnected or tied to GND)
>>
>>  =C2=A0USB2:
>> - used as internal host interface
>>
>>  =C2=A0We have the problem that 5 seconds after disconnecting a USB dev=
ice from
>> USB-C (USB1) interface, the USB driver complains that the VBUS is still=
 to
>> high:
>>
>> [=C2=A0 144.078347] usb 2-1: USB disconnect, device number 2
>> [=C2=A0 144.083425] ci_hdrc ci_hdrc.0: remove, state 1
>> [=C2=A0 144.083521] usb 2-1.1: USB disconnect, device number 3
>> [=C2=A0 144.090310] usb usb2: USB disconnect, device number 1
>> [=C2=A0 144.139325] usb 2-1.5: USB disconnect, device number 4
>> [=C2=A0 144.158700] ci_hdrc ci_hdrc.0: USB bus 2 deregistered
>> [=C2=A0 149.190274] ci_hdrc ci_hdrc.0: timeout waiting for 00000800 in =
OTGSC
>> [=C2=A0 149.196741] usbmisc_imx 4c100200.usbmisc: vbus is error
>> [=C2=A0 149.202078] usbmisc_imx 4c100200.usbmisc: Error occurs during d=
etection:
>> -22
> Does the VBUS be turned off after switching to device mode? If yes, how =
long
> will the voltage of VBUS drop to 0.8V?
The regulator turns off the VBUS indirectly, but the voltage is above 2=20
V. AFAIU the discharge resistor is missing.
>
>> But except of this, both roles works as expected.
>>
>> Here are the relevant device tree parts:
>>
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 reg_usb_otg1_v=
bus: regulator-usb-otg1-vbus {
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-names =3D "default";
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pinctrl-0 =3D <&pinctrl_usbotg1gr=
p>;
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D "regulator-fixed";
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-name =3D "usb_otg1_vbus=
";
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-min-microvolt =3D <5000=
000>;
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-max-microvolt =3D <5000=
000>;
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpio =3D <&gpio4 13 GPIO_ACTIVE_H=
IGH>;
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable-active-high;
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regulator-boot-on;
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };
>>
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &usbotg1 {
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vbus-supply =3D <&reg_usb_otg1_vb=
us>;
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0over-current-active-low;
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D "okay";
>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };
> Does USB2 use the same VBUS regulator?
No, USB2 has its own VBUS regulator. So the usbotg1 node looks good?

Thanks
>
> Thanks,
> Xu Yang

