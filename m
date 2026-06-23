Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB44D377541
	for <linux-usb@vger.kernel.org>; Tue, 23 Jun 2026 10:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210210; cv=none; b=rna5dAUorsSskzq10yQQ4SAgvewd63pEKzSLugIpQ5m56WMIqTcazluU0RMNE8kRmv3zJEHMwhneb/I+AoqyxaQrHDslei+giMdnEs9kXDFdddJSwAmGURRTO1i5LLLAsMtTpjLe0MctcebPdvs2F8Cc2L55kZsX4Om//i4OZpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210210; c=relaxed/simple;
	bh=WZdkz8VPqryzYY6OpBa6U6ny8/5VVgTdI4DFNNeNtjA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=BK+k6lQyQoULAS8veGBnNR1KBvd8dYPePwooMeYUZtcK3F0gPeU5LP8AIb/nG/c795q6HO782tKu2/RewwrT+2KfxrZPpHxtDsb9WdxWwCvN6zaAgKvjY/z3pxq6dOL8j+vjWE4g9RSeL0UfRo+VkARaUSKfygPhoYvHvkKb+ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=bc/Z2e04; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="bc/Z2e04"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1782210194; x=1782814994; i=wahrenst@gmx.net;
	bh=WZdkz8VPqryzYY6OpBa6U6ny8/5VVgTdI4DFNNeNtjA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bc/Z2e04FqKwQ0g4+tkPONXLta21UTbAgaMCQZ0PoMsl1N8ANW8hkbYQW3Nr1gRc
	 f2x82OT3zGTNe4JLnb3DiDv2rBB/nVpX41+kKh1donbhCI5R/nsw4tGrci6YmJ3Wt
	 Tn+rxiokGfCKpmD5fOuvGob2zimKm23dq4IEI3Q+Pn9X3OC8s3fyfAZQUHV8JjS98
	 T12vDrSoh4O8KYW8d0W5FdTPglnGkSdGA8GzRlkFsW/8z7bfYNFRw3gSFrKFTXFQH
	 RWhUCLN7CBULK2CwQlZrwpXwzkQZfHhy9jpZNkteyAw7UPSuAc6NFQMoQiBS4g4IX
	 LE46koF3ArG7xnGATw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPokN-1wooCX1lq7-00O10Z; Tue, 23
 Jun 2026 12:23:14 +0200
Message-ID: <b2fb88eb-5c5f-499f-9cee-6a69769c578c@gmx.net>
Date: Tue, 23 Jun 2026 12:23:12 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Stefan Wahren <wahrenst@gmx.net>
Subject: chipidea: usbmisc_imx: i.MX93 support
To: Xu Yang <xu.yang_2@nxp.com>, Frank Li <Frank.Li@nxp.com>
Content-Language: en-US
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UZnPCITxX64CqTjdTMT/Q3pC0coh3ky3YqdO8se9uc04Hi28L3b
 6CvUxUcx+vnmfhSb/sGXoPiJL0QC6evj149oTVhYYNoG2bWjOBT42GYfkrKxqqibJLk3NgH
 WXl6EnbcXxKD+PCdwoYcTedIeswtwnlHICkEs8SzeqRRhB/HvGNEV5hFmg5YuXgeUKvuf84
 T8Yj7R1GjyXLS5rOrssnA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:3MZrXn+7ZMg=;8Iijae2sqzLml03oD9gdKC9ggkA
 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
 dYNz/QHsElMUYPcso78FSvY955iRbHg5m1A4=

Hi,

during debugging USB OTG on our custom i.MX93 board, we noticed=20
remarkable differences between the implementation of the=20
chipidea/usbmisc_imx and the official NXP i.MX93 Reference Manual [1].

Is the USB OTG part including PHY of the i.MX93 officially supported in=20
Linux Mainline?

According to imx91_93_common.dtsi the USB IP of the i.MX93 should be=20
identical to i.MX8MM [2]

 =C2=A0 =C2=A0 usbmisc1: usbmisc@4c100200 {

 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D "fsl,imx8mm-usbmisc", "fsl,imx=
7d-usbmisc",=20
"fsl,imx6q-usbmisc";

But looking at the PHY register definition and reset values in the NXP=20
i.MX93 Reference Manual,

the registers are comparable to the i.MX95 [3] ones.

Could you please clarify which source is correct (Mainline DTS vs=20
Reference Manual)?

Looking deeper at chipidea/usbmisc_imx shows the usage of the following=20
register bits

#define MX7D_USB_OTG_PHY_CFG2_CHRG_CHRGSEL=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 BIT(0)

#define MX7D_USB_OTG_PHY_CFG2_CHRG_VDATDETENB0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1)

#define MX7D_USB_OTG_PHY_CFG2_CHRG_VDATSRCENB0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(2)

#define MX7D_USB_OTG_PHY_CFG2_CHRG_DCDENB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(3)

#define MX7D_USB_OTG_PHY_STATUS_LINE_STATE0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(0)

#define MX7D_USB_OTG_PHY_STATUS_LINE_STATE1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIT(1)

#define MX7D_USB_OTG_PHY_STATUS_CHRGDET=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 BIT(29)

According to NXP i.MX93 & i.MX95 Reference Manual, these are bits reserved=
.

Is it correct that the chipidea/usbmisc_imx use these bits on i.MX93?

Best regards

[1] - https://www.nxp.com/docs/en/reference-manual/IMX93RM.pdf=20
<https://www.nxp.com/docs/en/reference-manual/IMX93RM.pdf>

[2] - https://www.nxp.com/docs/en/reference-manual/IMX8MMRM.pdf=20
<https://www.nxp.com/docs/en/reference-manual/IMX8MMRM.pdf>

[3] - https://www.nxp.com/docs/en/reference-manual/IMX95RM.pdf=20
<https://www.nxp.com/docs/en/reference-manual/IMX95RM.pdf>

