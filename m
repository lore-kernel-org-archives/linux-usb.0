Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B233A381D
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 03:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783999208; cv=none; b=l1mH7cP2HEil5/926UsA8Vn2/S4WDOE8wf/JaBqO9DkKEYtVJ77WtBN4xdfs5uE1wfuvKtrznF7ioPniIINPcb27PkT283vZh/g0H6osr9xrN6ztN93LhS9YY10smJvWjOfpxEBUygBoUaXzY4FzAejEdtNUz7ykfMqQpe3FT7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783999208; c=relaxed/simple;
	bh=+/S22kMW7/+loIW+zeguuEGkg/5tPuwQR//oJwuZZDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLHIJY7Ilt8ukRXHTUx/3fUEJKtbkKheUaayap071KCrpfnoneIhvYxqydQTr/dzeFY7XDTAodKY1jaUH7bycjCD4LC4GTJYlW60YTautEDefIf6xxH6+7hlcB01g46f9uHjD+yW4xrmciUZzfhVNjzZXaT6eL2q277topNINNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMwPAdvv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AWyOggLB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMwPAdvv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AWyOggLB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38Rq53303190
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 03:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k1pfnEfNlNBd0jQCJ7S2U+7u
	jH/MbH8zaxCRpzdA+NA=; b=VMwPAdvvVMfJ+AsseZ0Nu/0saPAXow4gekEybIYD
	+YtfmrktsBe4i1yQnvvMLSgqA3rVI+MeeurYBLeSkxZsH8G8mkWr+ROveFA8g07Y
	bvziEsgIkmZj+gUh1TEsXNkq17A1yvHAtG199iB8l/Jp+kh+FGjqPRH3X0STSp9X
	N959GfKaFgMdLr3CRqOeZqeFSWIL0AqU5cY3+1OyxDg5rh2BvYxk0IMk+ep2rbjz
	Z15EhMM8rjqgtNkRkSinzK1jDLScPzHk1+FoiBe9Uhvx3W1FRey1T0u1L12AN6Qw
	Q0Xl8vogrK58XkVkL7gHR6eF1GuCVX8T5qepb4HKOpFxlA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p1q2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 03:20:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-caf5fa127d4so802602a12.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2026 20:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783999205; x=1784604005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k1pfnEfNlNBd0jQCJ7S2U+7ujH/MbH8zaxCRpzdA+NA=;
        b=AWyOggLBxkza49SU/mqHXt4XY9swP2ZZj2mQrVGR7QoywUaRYrGISMs9Sy8d+px3kv
         OdGW+TehAYTo/i2iUrP+zoH9DitDUk8cm8a3l//d53CrXhSNve1GTxlx/ZL9QO9XXWRG
         UY5UxAveAFfM0yx2ruaCJfQxTE+8bb4HS8fn87oOTboo3fYdr01OOsHkZSb7GtUHBBoT
         eDS2qoCwiDuzg4b/7INdtn/7Egsa/VkmKCChWMc6kfaDZNI5N3h8E2LGcxUkNduxdWsH
         Cf+Gvrw+A1wrTNLrMKwuB0ExsZTUIwkt0WKCF21o5LLB7D5vXKZDxQagNmiFCfc08tWt
         mHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783999205; x=1784604005;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1pfnEfNlNBd0jQCJ7S2U+7ujH/MbH8zaxCRpzdA+NA=;
        b=d91Hjd0vwXuJ+HZeaEyyzb7+wkgJK+NMecbZpkyPvoJFmclJ81B2rhBPUtJC7Ow88Z
         zPP3nugURunulFIARaiN25w8bJfMWd2FcZR2WFhPXIa+ATQsf8w5Bx62U1dIAY/9H+51
         94/ZsHKVE53ERf0I9Fwd3eVCaOonkX4tgv6aqQrP3Db8O7mQs9DntSVGj5dACysiNBu5
         xIdP0VaAlQp470Uii1jazfn/I5IBYDoHvr+w0YraQMsEOy1vlHwTauSC5hvx/33PmB/F
         fniymRs842GWPVfbAJUGJgbruDLtVkniNYrdzGMewk661099kbVD/le4y6jOfFtVl2bg
         JS4g==
X-Forwarded-Encrypted: i=1; AHgh+RoCVQ6dQ6NXEX9WVV98hcgmOPh0ZBNCf3jh3m1rpLpW+2mhkYd8+splVUltk1hsHcy9D/s1A7tTCVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC+9WypLC4XbI6Q9jlHaRQE/hk6B5tAPq38KgqgvIZJA4z2POA
	k6IwCrU0QhUyHf4Yc4l3xoFMOe1WnrPptiuqNK1V2NxNBy0MhrNZVP7W1tlm1/1CtiuqtCByLIW
	muedQjCN43/FlaEq/XjD3RX4WkidKLRpd/8k/bV9brg7QKdBXKbd9mUdoEGtV170=
X-Gm-Gg: AfdE7clIJMCB3dWm+9/AAPoEUAZ7SczpWTV9QRvM300lXkkheqanRoa3T+E1f42zwk6
	xBhO1EHN6mR0W1IL0SPLJgPiSuOZaMMxvr/w/hjyvmCy6VW0532nJWDi7/UDI6RScZQ/roJF276
	gk5IlY5wz+gA6/AGp8A0YxITvVE1jcXeW25851/FPAf71PKBe4vz6gadrLTYzwFCYQUuxsoNb7T
	ENad6FwZqI+zv90FnhjkgAVEICudU6fpbIc2QMLrmbDgKDIuYLtlEyRBe3g7aSPDFFPjT6ifEnE
	iHe6yXMgxozHlxXCU8DJa3iUGSS/J9WODAkWBPlhaZ/jecai2c7m5wrx3vRglFGD3r8+Ytxbxk6
	ylhvLw5J4RjO4gAasyT2BsHMv1g01Ub7nu9kKiM6UR0rwMZR3GxcTYG3DFcX0
X-Received: by 2002:a05:6a20:d81b:b0:3bf:7081:934b with SMTP id adf61e73a8af0-3c110163ecbmr13341077637.26.1783999205433;
        Mon, 13 Jul 2026 20:20:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:d81b:b0:3bf:7081:934b with SMTP id adf61e73a8af0-3c110163ecbmr13341043637.26.1783999204930;
        Mon, 13 Jul 2026 20:20:04 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm81154981eec.0.2026.07.13.20.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 20:20:04 -0700 (PDT)
Date: Mon, 13 Jul 2026 20:20:02 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Message-ID: <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox>
 <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
 <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com>
 <alV0_DHvBFpzDumP@vbox>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alV0_DHvBFpzDumP@vbox>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAzMSBTYWx0ZWRfX46mzaCnQPbsQ
 DMdERBJoNCmlrPOU7QbXgAl9ksbnxIpB8sIv4ytte9vDw7uhy6BbIMHFgH3OT9KtvXquX1x/Rmr
 eXAVXUQjiNf2qfBpTST5WBy+Y74wO2g=
X-Proofpoint-GUID: acutFyRYt1C63cP2EZ_2hnRuyTv9rAnV
X-Proofpoint-ORIG-GUID: acutFyRYt1C63cP2EZ_2hnRuyTv9rAnV
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55aae6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=G0XHSz-fAAAA:8 a=9s4_ODXOAMUL3Z7cIVoA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=9GzJQMQvVMogKS571uVa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAzMSBTYWx0ZWRfX7R1S9dPmhM4S
 jecvFFLiHzcw8etwHdZ7xckPNnzA9jwPSGo0mTbxLlUbaXu8rIPnkQ3igrmR+u1arLJGVmvIgdW
 ydGH8Cx4nNQO9nYH9tAcst6oL0yYY686U2n+HAE9mwC/UWzo0o/9I+P4jbAIRjU8jqSQ4aeaFPD
 c7wA+9XXI+/5QWeNGAGSgHTVy8IoDqyFzuKC+LYEA+JdRvcwS7gzOiq5Jopw/pXjijO+gn4H1vp
 8exVVqnH1WUyhoqkSbjwXiFVnTbW03c+ji7B3ZQLVuCOL2oZZMkfhOVgxM1+Vzh51Wo8pu0bmE3
 4pWfYfE2rs8DqcpYTvZ+0qwCZVEaJcePrWypW/BEX/4CdgLDJI0CzcVrfVut974+xigfghFGoh7
 fSTE9RAecqymd/JleQ1DkOe2GKe22D/MdqiUrKafD/Uke1jzMx5q9ldxKVWM1ym/wvpb8mlGVAZ
 B87nxNzdtDpsPh89Wiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140031

On 26-07-13 23:41:14, Thinh Nguyen wrote:
> On Mon, Jul 13, 2026, Peter Chen wrote:
> > On 26-07-13 08:26:59, Krzysztof Kozlowski wrote:
> > > >> And Dmitry already said this at v3.
> > > > 
> > > > And I've already responded to his comment in v3:
> > > > https://urldefense.com/v3/__https://lore.kernel.org/linux-usb/ahjYwJtiMsm0BcCh@vbox/__;!!A4F2R9G_pg!YksJ0tPtRth9ez8t0GB_WaxH3ynx3ya8M8aFIyKfYpApRC_79Ig93CqE2MKcrGJ6O6t_Dl3RD1zftrnxhdtcfoW7hgep8w$ 
> > > 
> > > It does not change the fact that type of phy is implied by compatible,
> > > thus you do not get a new property.
> > > 
> > > 
> > 
> > For USB2 PHY, it has property "phy_type" already, it could extend support
> > list to eUSB2 like below, dwc3 qcom glue layer could call of_usb_get_phy_mode
> > or re-use dwc3->hsphy_mode depends on where it needs to use.
> > 
> > diff --git a/drivers/usb/phy/of.c b/drivers/usb/phy/of.c
> > index 1ab134f45d67..5cbf17d493ad 100644
> > --- a/drivers/usb/phy/of.c
> > +++ b/drivers/usb/phy/of.c
> > @@ -16,6 +16,7 @@ static const char *const usbphy_modes[] = {
> >  	[USBPHY_INTERFACE_MODE_ULPI]	= "ulpi",
> >  	[USBPHY_INTERFACE_MODE_SERIAL]	= "serial",
> >  	[USBPHY_INTERFACE_MODE_HSIC]	= "hsic",
> > +	[USBPHY_INTERFACE_MODE_EUSB2]	= "eusb2",
> >  };
> > 
> > 
> 
> eusb2 uses utmi, so it doesn't fit here as a separate mode.
> 

Hi Thinh

Yes, eUSB2 is based on UTMI Parallel mode, but it has dedicated
Physical Layer Supplement [1], eg at CH2.4, it lists eUSB2 PHY
Features.


> To go this route properly, we'd need to introduce a new phy type
> attribute in the phy framework, which will be a bigger change that may
> impact more than this driver.
> 

It is not at generic PHY framework, it is just for USB PHY dedicated.

I do not see big changes, it only needs to change above files and related
dt-binding files, and other users may leverage it if the controller
has special sequence or settings for eUSB2.


[1] https://usb.org/sites/default/files/eUSB2_1p2_20211217.pdf
-- 

Thanks,
Peter Chen
