Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA92A3B27C6
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 03:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784086683; cv=none; b=OUmO+ai63tRx1xrrAZjFLfkbBa6mma/Z5sO3V26EHW3hmMzbh/TbmS7pFRKHOo1EHf7sqk3hWG3XZjvI+wgxny1AM0N9hL6+qE9wvDE1xmqlLT2AzbZMLNAAtSrRCYZTYuLhPLnel4BBn6Q43l9MazblUwkj1RZSIlxs4vMxRk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784086683; c=relaxed/simple;
	bh=oyFkWMNa9fRt7sFWFB01ejvmlxQL3Rm6WRjhlInZEk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uziXSen3HTgFXSK33YgNwBOvS3i+5HcC+wGIaXC92nVo1PT6yMc3js10X61WDl2KiDm5PXfTAMm2DvgHcaeazO21M4vTdA18nTjgKn0NUDaFZTYloWxB/pyqKSF6FHBTHCH0Jdj7y7wx8cWToO+/V8gMYQ0lgibbB+ZBUnLOxPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cS85yIjy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XLMUqEQj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cS85yIjy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XLMUqEQj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0I5vF2222801
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 03:37:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7e9IbSuaSjhO5SzNL0GuiEie
	GTLyIZc7yOYtJCBxBik=; b=cS85yIjyVOXE4H8ASxvmvqe8Xyd934MpiEl4tqFw
	qasjj9YLFaF9bGV+QO8BOOu0DUtBanN/pRvWRj4ycXEizGSD5To4DV2n3s0OoSYj
	lMpo9dFlp3wRVUo+oKeL7LFKHpYanJNpJ17PaofJO+9LZ76lelElo0poTWMHZfBb
	jHvgXXm1w+KELX+wv0VPFlcvpal2N7WO47dSntGSmt6zH1Ycs7Bj/r0y7N/iOLBO
	leDl5LMjTvOGrfXJtQ8LbKABcreP+AVCLjrfH4zFOoHszzJB/SeNcfQe+XMALvug
	aa5xuG/rErcXEgZE8YvqB0MQeKNW8C2H+ZxogUQOCwSv9g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnnuttc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2026 03:37:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e095fd889so3359221a91.2
        for <linux-usb@vger.kernel.org>; Tue, 14 Jul 2026 20:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784086673; x=1784691473; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7e9IbSuaSjhO5SzNL0GuiEieGTLyIZc7yOYtJCBxBik=;
        b=XLMUqEQjTRFieV/WsbxC5KiDImZDklqKeOIL308oUetVT0ABf8cKw8N3VpyFNflHUs
         qRiCeaNpB6gMAhwB1GI8l4IdNEjjKiiPHed4kaDXToiY4e2Tj5f4nVpVIt+i8StBjkfQ
         osm/vmB9mhnGFvVhHhwNC5cpdGVeYeoXOC0CgMVIENBjglCH67L7kQ9+k39h9nLyV7G4
         M0nrR0TPlrXFmkiDHolSAXV5OJ/1GJieMrH+HozsDKUOQofPdUqrR6orL1JSpaQTjg+Y
         XMj2TXzpbMFPtJxnUMfWIpIyArYmkzgplxe5WzaRxlznc2Ocba1uYLgn3WGGbi3FV3Jl
         Nkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784086673; x=1784691473;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7e9IbSuaSjhO5SzNL0GuiEieGTLyIZc7yOYtJCBxBik=;
        b=hV8Vj0+v5S6X+bjlVN/8KOuTU2kM68wdzsYf9p+xAVfAQ67wpHu0cFVmF8ED9XMVUx
         xCZa+HciYQmzKnBvdIIl/YXtw1XWuqvqLQGpCc0Xmj41J9oJaA3/M/72tdlwvw1irwWU
         j8iDDTnvUUOSJBiekb9siwiOYuhusai1oFUKToUMWBXFuYicubeeypVdfYp+crEJADHQ
         2CwzU0tVvx/8yUzf/zg7xigcPvPJa6bXOf9A39K3VwgvtSzqv9BkNulMylHuC38frgs6
         YZURvDyjf24wL70txTX4163a5CguIxaqFNmF5dZhsnXI8c+EslPPfywHTXTVErfnH4tV
         2QnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr9PCjgbDb7LS0YAlHTMQXWGscuTUipmJs/JUaw2AguzkV3B8qFPWVzIPtaZoFbVaEz0jHjuY+39N8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKA54Iu6mOSx6eQeDmF7KzmRdg033i/Zl06QToqFVIHoIkvKVc
	fzRgvwqmaTwoR123NV9UXR2JxuSM3qEDgllJ5aoGNXFYVKfUzdWtaFBduBn3agOjOlBlWoKLEbR
	j/OUqJTrSt4y0S6lHRb0l+UlzuQX2qFTWUHxw4TZu0CA4pC1dzrWk5N2ocYWQqAE=
X-Gm-Gg: AfdE7cnZpmVMvrDxoK2WgPtveemgA26nejiicCteReXTrxgBknbPMKDzGittKUmc6ec
	k5mh1AauCn96UsIljThPKMOWQ5sGUg0t9AlzBwiQFc2in5CivuWoe6GXu/OGwZbv0bXn0cxtEnf
	kwf7k2GhU6wwu4+TYj53xcb666UmE/jlhil4R0XbL36CsCOuX+o20PqpkYXHyWzCw2UX+BQVcav
	x1I2g6SVdoK9xEMo/8v5k4MZCcIDZj/jRGMDsONU14onpp2uXrfvAFw3ml3q7yo4RHDfrwsa3Z1
	pniLveK4tOsqpaoClvGqnotV/EUZ7WuCvmS5fWSGv5apmgk1BLn7LAuuG09SKrkS/G9yXU9rtYg
	tVrbdVUC+QNv7P2XJ+p38Bvnj1KrkASmhCq6MHhH4dEwDOfJHqfVZmjnYYKMh
X-Received: by 2002:a17:90b:390f:b0:381:939e:adf0 with SMTP id 98e67ed59e1d1-38dc7752a8dmr13926715a91.31.1784086673450;
        Tue, 14 Jul 2026 20:37:53 -0700 (PDT)
X-Received: by 2002:a17:90b:390f:b0:381:939e:adf0 with SMTP id 98e67ed59e1d1-38dc7752a8dmr13926691a91.31.1784086673026;
        Tue, 14 Jul 2026 20:37:53 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b0240570sm53899311eec.28.2026.07.14.20.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 20:37:52 -0700 (PDT)
Date: Tue, 14 Jul 2026 20:37:50 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
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
Message-ID: <alcAjvLJCz9D9X3p@hu-petche-lv.qualcomm.com>
References: <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox>
 <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
 <alFTxg0HLyke0gCK@vbox>
 <b60b4d96-ea67-44d0-a627-c50ef0ed8615@kernel.org>
 <alSRvWY2LWp8OeOr@hu-petche-lv.qualcomm.com>
 <alV0_DHvBFpzDumP@vbox>
 <alWq4jAGPTINnpxD@hu-petche-lv.qualcomm.com>
 <albAccNnsI12AIUo@vbox>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <albAccNnsI12AIUo@vbox>
X-Proofpoint-ORIG-GUID: D1eDIohL4dsLl0TjLDpYSzsURmzgoT0h
X-Authority-Analysis: v=2.4 cv=E+v9Y6dl c=1 sm=1 tr=0 ts=6a570092 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=1QtRUzTFQfe48BcbiroA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAyOSBTYWx0ZWRfX8gj5cFWrzFmX
 iTuS++vxecT+shyYvM0rx4poEsbcdnHYjlN/IbQ0G7/fdaubDd+AsG0Ub4h/Vq9eDtJaTbjN+Ho
 aTAdfPkQilpu4KXqAojm5p8iHUy+PCxKlk3h2Z2HrZy6lf+XXpyVTEjvn03c0ZOnuIgi+cq1RQj
 bGzJs+/RueQ9zFgROVErDOvlQ/i4u4iNUvukyKSA2mgx8+xiNHpqpB566LZcHBUcw8pixfPP8TM
 PFY2aRdhCRFEVdod5f03f2H78XYl868r35BNh/HAmNE1GUhIEKICYk5BMIIZrDCIK0jDsujAC2S
 AtwoR1nVlNVcxRSJ+cO+vvhOdpp4uAvkWt6v2aCLyvkupw7UW2/sUZeEUFjTRmc2wYufEOeN+Ua
 62a+y6Qi/XBQU4hixSfqMUKnafPLptjrIRe1x97T36qgAwdHjtLNvl63ahbDARf7XC7rNr3UV6o
 AJDfPu1IIU+Ngk94fag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAyOSBTYWx0ZWRfX41ySLw+SVY3X
 VSYs28QTBx7jH7N99ScWrG2xlWZ0xfIpJk802aEiXv+TU01EuQ2vmmnowp6Wsfu6Ht9ePqfgaSD
 wmlovPcwWZ4PVTwhR/44df+ZybzhJ5w=
X-Proofpoint-GUID: D1eDIohL4dsLl0TjLDpYSzsURmzgoT0h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150029

On 26-07-14 23:23:01, Thinh Nguyen wrote:
> On Mon, Jul 13, 2026, Peter Chen wrote:
> > 
> > Yes, eUSB2 is based on UTMI Parallel mode, but it has dedicated
> > Physical Layer Supplement [1], eg at CH2.4, it lists eUSB2 PHY
> > Features.
> > 
> > 
> > > To go this route properly, we'd need to introduce a new phy type
> > > attribute in the phy framework, which will be a bigger change that may
> > > impact more than this driver.
> > > 
> > 
> > It is not at generic PHY framework, it is just for USB PHY dedicated.
> > 
> > I do not see big changes, it only needs to change above files and related
> > dt-binding files, and other users may leverage it if the controller
> > has special sequence or settings for eUSB2.
> > 
> 
> The usbphy_modes describes the interface between the controller and the
> phy. eusb2 still uses utmi, so adding eusb2 there is sematically
> incorrect. If we introduce the eusb2 mode there, we'd have to audit dwc3
> and every other driver that uses usbphy_modes to handle the new mode
> correctly.
> 
> That said, I have no objection to adding a new phy type for eusb2. I
> just want to note it is a bigger change relative to adding a boolean
> property to the DT binding.
> 

Hi Thinh,

Only the new user for adding phy_type="eusb2" at dts needs to check the
controller logic, and this is what the user needs to do that check the
new added device tree property logic at the driver.

So, it will not affect current user for phy_type, and I checked the dwc3
core, it does not need to change code for new phy type.

Currently, it is only benefit for qcom platform, but eusb2 (uesb2v2 later)
is the common USB2 mode, other users may leverage for this new phy type.

Krzysztof and Dmitry, do you agree we use existed device tree property
for this feature? 

-- 

Thanks,
Peter Chen
