Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAED280CE5
	for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 03:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784516608; cv=none; b=lEQJYFbqckIkYju4GSs8tPhh2sydm0s6m2BeYV1cfw52hqO1R+etRwoi0tDfBmd9mpC4seC51gx2vr0gpO/teJV2zbek3qE4bGLQtHI9oW0now3cZJUncMWXsWf2Ufh35prKwg9YJCtQjPsJWYt9XELh6AqW0LxBi8Zyk1/0dp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784516608; c=relaxed/simple;
	bh=e/ZlQ5tAodvh4tTGdft/9eVayiub/eigzOs+VXki4oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2XBs04mRhBKCcczzTOr+66AvtCNCgzUJintCi1M00xgMCXcW29ivd3hMa5hTX963h24/D3zoX0Gou0sPGM0wByXye/eEpxevMONYvHRPKL0KWe6GXarljZxfs0OFLNgsmyLQ5OUvam6l+d3ZV4Y1XhbPN9V58lO0JH4P2AZMuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RY4KiKQg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtL/0YsG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RY4KiKQg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtL/0YsG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNsVP5657699
	for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 03:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FMwWL0yfpMyfDszsnXudq5ww
	Pn4l95TMtQFUPbOy0ds=; b=RY4KiKQgVXR1FMZ8eJcvzSXTTZxNVZxIxBn7t0Z1
	Gr4UT1hfZ9V4ugNNK0r0U2/4MCUz4d5KFG5qAqTcWo1JvZLRjZvlYq/Hm5/khhCX
	hgwWYxE8XdtRVQ7yjorms8VFv/RBJksMkLb/j+wJqfF4sxRDkH64PRfG0PFvgJxt
	4g43N6sWLgNhpdW38/5ExXjl2y8YAM2xVMxkYKYavhQiommB/dc8dAOrrXSRWSd5
	NCV9jhcvDJap2vNbLMLIif8XIzNNl+slDglOLtqMsjYHKxRmeNFu5nXkve9Z3mdx
	Q2Vy2mC6yC9szpCt4OX/IQyJFWTs5SdNmS9ImXgobH33xg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chm2da-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 20 Jul 2026 03:03:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso5990654a12.1
        for <linux-usb@vger.kernel.org>; Sun, 19 Jul 2026 20:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784516605; x=1785121405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FMwWL0yfpMyfDszsnXudq5wwPn4l95TMtQFUPbOy0ds=;
        b=RtL/0YsGyrKD8Fvz1wcjfuyHOTAjzdOZ1s4jfNSCjXAw14NtdQ+2k0xd//VDcnqkMu
         O76Yskt4BLEgKvl+EfK0raVX6BlelXhdf02v0SjuuiCO74NJeD+NHTpUQ4ET0ux9MwHE
         Gw3UukXsDVvJjtA9rSGlslxnnmbVyyUBXaq56VHsjIM4sNigaDozr6ylM9FZazTP3Fxt
         G2UhxlH5jvQXMqAPlavfv7Ri1yzy1eeLdL3M2opiagvVyN+lkGBLkmgp051NF/nUHRS/
         TnZkaThJHhV+vuEZm+3MtZUR/fAj64546at14jAiojYur6zmv3cE8F9l5Tj/Cz/YWkIY
         sSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784516605; x=1785121405;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FMwWL0yfpMyfDszsnXudq5wwPn4l95TMtQFUPbOy0ds=;
        b=ZKZn7yu9y62SBimUAjpDYCSaUJBmittKTBiPHbZXXrMwYroyEEO8F8w8TtmDclz2Qo
         LEqK2h4Dh58NjDsu4SDaBPfWhjGCGy/jVc3W5rtM2l16/CYIX7sql0wQBO+hgjdmWwCW
         XHmond3b8oTPv/jJJtP/meQh048+S57p1jN3EIGsBjUHanZxjDERK2HDVHNOwhIIU9Q+
         s/Hc+7QYFqrt7yCnreaeTWGPgYJjQMpYEl4OT1yBhTBIlpdAOQjMqsQDv+t4R/Pb52bZ
         4dsQuJbanzNBUpkVqMC25+qwf1mfkoX3sOYQ4IGUcAk2C9rOios61o0xOVQVGGyu8ISD
         VzxQ==
X-Forwarded-Encrypted: i=1; AHgh+RrNwsrviDFgj+LDJb1b6qM7YIhWV3rCFafXt5eGSLslJi4oNOeEyg8YgFNCRsfkTTAMSPogsdX+JD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxIDIynnYXanmqvfLQg5kXMQOg0DwTjMf3MTWUt09pdxfALLb/
	nh9gnNMZf6gmK2SiunpksxE+tOaSKC6V/ey3qLeoenz11Z0QicqqR46QsKWcJzkJNnrk0bpQhW4
	7yVzSaPNWdC3lPP3nVXlFVpg+VBSUEI41XRXsX4heiCB7rAjoFbUqm7eiTiCC9Zc=
X-Gm-Gg: AfdE7clw4Q/whlNhMrAF9WMZbKmJk4XAQcDwGK2zRk8q8hkUuKUFTpz7mTxhxad5ed0
	Zh29CrU+8JjYWP/1lIUtEApoIpu8noMdYDGVALxjTTV3WQL+3gPZlrm5OlwUqG+BiCGeL7t9eHA
	wa8moSMdKMV68yTmznIYABoqpiqTB8XXj4BWC+gQ10OH1Thrc/LQ9d9lGgdA5OOwoBu29PVY3zv
	VGBf7SrdNi5bqo7uy/MwLYh/Vf/9Bqt2E1c3DDP4EP9cr9bhJn9UTafl8CJ3BV+Dmc2up7ueWMV
	68PDocU6wGdQpRIH4dW08x0qvmb359/lqHwe185Nuepms903XuGwFv+PbOgUQW24LR5/p2M9LGW
	HAEGdJc8Z3X48qimgiWNIrq2hkt8r7Okk3jo+diLlmKQ9FU+9Rg==
X-Received: by 2002:a05:6a21:103:b0:3c3:8440:f6da with SMTP id adf61e73a8af0-3c3ad77e60bmr12918566637.29.1784516605240;
        Sun, 19 Jul 2026 20:03:25 -0700 (PDT)
X-Received: by 2002:a05:6a21:103:b0:3c3:8440:f6da with SMTP id adf61e73a8af0-3c3ad77e60bmr12918537637.29.1784516604883;
        Sun, 19 Jul 2026 20:03:24 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cd764fsm26154128c88.12.2026.07.19.20.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:03:24 -0700 (PDT)
Date: Sun, 19 Jul 2026 20:03:22 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
Message-ID: <al2P-hJnQd5W-LpW@hu-petche-lv.qualcomm.com>
References: <ff5e00be-dba6-4597-b2bf-288147cbf60e@oss.qualcomm.com>
 <algTE3PyJVxLdFq6@vbox>
 <b697c933-4556-404a-95f3-2a347a83e390@oss.qualcomm.com>
 <ali0dEMbSh4STLmi@hu-petche-lv.qualcomm.com>
 <allvBYQN_0QkI835@vbox>
 <almDYCfHf4WV-giY@hu-petche-lv.qualcomm.com>
 <almJeSq1zfcC1mjj@vbox>
 <almknp4Fx4EXqjm-@hu-petche-lv.qualcomm.com>
 <bea99c43-16c2-4f5b-b14c-e1a518b97e11@oss.qualcomm.com>
 <alqZQL_TrQ7Da4Zw@vbox>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alqZQL_TrQ7Da4Zw@vbox>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDAzMCBTYWx0ZWRfXy66UwIdEd3E9
 C3NUXk7WDC6XPEp4wQcPmBI4DTyFRMwxS01rooXNQ8ok9Yq8tRnVWd0DomS9VCkJTMLI3d1s512
 2lrQrXzVjazRciQUuEbBh65uqkH85uA=
X-Proofpoint-GUID: dnBPJauYArbLc5hiBpCKRwxQGolB67k4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDAzMCBTYWx0ZWRfX1WSYF5gVBVK1
 2WDPdBPNfHZU0DZrsRxXtj/PZz0P4TA+vDk5iW3Upc2f851rZ0ZrSF+b929b7SJrt3tKs09g31B
 OtDMuGKkT/kkjyoN+uGpdn7hmnmcmvg0/yGqgL/t7T7QyHifW2J0DynE2p452dmB7TdKII0D5Wq
 U+3R7tl2AA4RZH7QUGC7fbFSAOGHqYqD/l9k2y1u2ffakuUw8N0CC4DFBmo1yP2amPo8kprv0jq
 ipp8zSFbFIax97p01jNjOaH/D7jBcirtKthZHZUEFDtj+/ETHDSK2Vs5qQxPavOdbdCjx/N+EjK
 Y60Pn9Bjc6CB/L7ISj8ex7gVaq1Ojx45mAFOhgRRKev1hKqs0uECqezvS6q6Cu4nfaBjeaGFEO5
 aiKoTqAiDwOMz6Va5V4s2xgocgeb6SS38vZCmaTCWyqJHFAzbUY4s8go3SIH88O7LLWC7lmtJmn
 Tk1pahQDOKdbkC0UJpQ==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5d8ffe cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qpuNF6eMhq1g9PuOxCQA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: dnBPJauYArbLc5hiBpCKRwxQGolB67k4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200030

On 26-07-17 21:34:37, Thinh Nguyen wrote:
> > 
> > Konrad did suggest this on v3:
> > 
> > https://urldefense.com/v3/__https://lore.kernel.org/all/3de365a0-4632-42ea-8a8a-5a4765945a76@oss.qualcomm.com/__;!!A4F2R9G_pg!bFfHVkKIznULZPI2qLzahGobT6OIz4j3-XA_n_3hHnRuvzps_XuAGJdphzxkK4bk6twEah-Zn6xRS1uCQCjZ1ud3HnRftKhw2SXfqA$
> > 
> > This involves cleaning all drivers using these enums if we take that route.
> 
> We should not be using phy_attrs.mode. It's a runtime operation mode.
> 
> Instead, we can introduce a new phy attribute phy_attrs.type and
> phy_get_type(). The phy driver can set this at probe and the dwc3-qcom.c
> can query it from the phy phandle.
> 
> We can define PHY_TYPE_EUSB2 along with the existing types in
> include/dt-bindings/phy/phy.h for this attribute.
> 
> BR,
> Thinh

Good suggestion, Thinh.
Krishna, would you try to do that?

-- 

Thanks,
Peter Chen
