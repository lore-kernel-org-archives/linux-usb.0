Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686784;
	b=Gf3Zcu99xSOUYbNXESVK06eiWVS90qpihbC5S5ec7rbH+LvSYvBM8/WISgnznW6sQUYN
	 9rQs0Ryup3Sstl6k+iAVuzzcr1O/F902LJEw7aKVkXIlYN2ZOOpL+OzCpx4QxAze0gugh
	 kjiGVNHhVkQS3FeiUO+AWrfLZ3X2DDvr5icXV63Qaw/6JdN8HOtExLkv/wS2nJA/Kxwed
	 1p0vVYa/16AWUZLgxO4m3dlEvaSovf9DyZlX75dbipWuFKjX1JbIx/9HiZ60/YOWO0etL
	 CQbUgUW1saBOaDS3+WkmA3RF1BHOXcEyBUuqRZjY86/xx+TmGBfMXgeaFPaM/kpCobw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686784;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=E2j0JzBrT39iZzv234VrtR5wNtIxKBImAmFep80GqfI=;
	b=V5zdfYnhgKnKBHQvHMqNUnDlFgEdgrAyaghPmq6ewaiiFZbxP6wnm+Tf07PVUEE7s9B2
	 hUjlFoUphF80H+r+lyRDEV4mOq9+E87f3+LGwK7Qla8nC5RxMmmVbbcGYOLKJgwbJDLuQ
	 E2nttf+sGZWkzMIbHGBUvekNS3IGMFJ2wRO5jjqSYbsy3zrflCN1565v2X3iW9bLL4qFl
	 6hTAYt/zn7HnbxXXS8s5k02IICv7NJzuEV1/1kAft+rtf252Bh2eWLFXJAIxSxjwVjS+2
	 1NBGgobqPNQh1lDOu5VPxcpl7Ggxs6fjt/PPi/HnbZAEPOWFfJWNmQ3zYLcXet6G48g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Mc9h3/Uk";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VEZ/deY1";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5069C606A321
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5069C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mc9h3/Uk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VEZ/deY1
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Ar5B2885419
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=E2j0JzBrT39iZzv234VrtR5w
	NtIxKBImAmFep80GqfI=; b=Mc9h3/UknOwyvCPTH1GeRD+vMprPLoWUwVP3C+qC
	cWexvpJgI05wKhHjpR0g56gTImT1xH55JR/tYk8H70I5B1nJjDMHueeRlAoq4ItS
	QeBaB75nxtggtf5Df6H1FkCK/qteXt/U67uaR/ku3V8DAqYEA8JHxGcbCEn77p69
	vNuCi3PfZeXpJPoeXHpNdfPBs5ELr5Tg63BSsm2z8QjM+9iFH60ax93AG0r5198Q
	cibX/Yzt0hbTPuI9SDYJbgVVPPxlaarXSoByTFPjlQna0uNKyk9QJ5m36iXZA3qE
	xIGkBKShiDxd73DD/VTq0ndpQbIy/jYDhAkjnP78vXmgEw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rguyg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 09:53:03 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso8576953eec.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 01:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795686783; x=1796291583; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E2j0JzBrT39iZzv234VrtR5wNtIxKBImAmFep80GqfI=;
        b=VEZ/deY1OICLllKGASb2usUCc42X0dHqDXpl7m4eelpvwuDmrp5mXFyWV3dIXE8HRY
         +sQjw7oAcgB7fgt2QW3NsPZq0ZcPID4aciEG+UB22ROTzY32IjLXj2y0CvsuVeW7mT9M
         UtRAluX+dZDc9JIGIwiLOARG/4YPNYNtGc+gDxiU9isskZmZHaUhoA0EaJNk46BmWGuC
         faX/6jELW8jgFshZ3exu529Gbhqphma/pWoM1FpBS5B1eMXQm6TS3SnN4bxHGyWhsKYw
         DcA2di9Z6t258LJ6AlEuVjLIC6VhHMiqZ9ZEBP2RBK1bi2PCRre1QON2pgMykPu3ivUj
         Ixew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686783; x=1796291583;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E2j0JzBrT39iZzv234VrtR5wNtIxKBImAmFep80GqfI=;
        b=Lg3PLh8EnD+hdQcjEmPcMx5PRzH4/SRuCYP9H5Lz+YfgUNU+EuYjcSn2V/10tOstv7
         bYWQnrWAnz0YUXvGWVeiESpmeAzHFhlfaP9DA1CXaIKSe2p/X1oQTxmPzquT4SxVMTat
         0tRS9XaaTT5xB2E3y1wo9alwcMWuuG/JPx+25puJHpm7Yt9M9hQrcGZiNw4S/UWr97Go
         +v9r9ZZHDuCyBK307G+n4Fyv1CbaFnenNlxR1TEnszJt101wXllc4LxWyW7lMSnpBev9
         wuIgnU9txLcm46qexpl6ZX3E3FOlv56cBkqTf4+EnFsCIUkMy0ObXSsGLIAY94M680ef
         jPRA==
X-Forwarded-Encrypted: i=1; AL+hErEEzOMBYw4ajed5pIriguGTsI4xTB1YOGaAWBvPpzE+aoELcZViVuwLIHtmQx99b/evHhLM2XI+lsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B8wqHgI4GN/C+N6R5AWYB4gHxXJWGDqgdXlJAebUXI5lwK44Y
	b5q2KwI3tBSKteyrtfi2Hibak4gJTP/qMExoa5o9GShnVg6QBkj0ymweW8wuqnqX0dkL4VW4g4b
	Ur5s2FDVduhd0DhxhQ57FsR4iU0x2XaB5eG5j7jAKUpQ53Wm03caMD3lp5pgEXJY=
X-Gm-Gg: AZFdTZdpU/l+fn2nBGL0auA7ArGFoL3dFOz6F8stGpS7R+AU7Xq3Z9z43IKu5S3rED6
	xvUV32Lnf1B7sYnXBXV/f6zvJMPJlzwCFnuSeS9t6ZV/0KZBnrbWLcr1h3FVcSa7QWWM6THh4Jc
	vwSNJWK7y497gEVLqLRBnxBtT65iLRTvWfEWQey1qzRCw7U9x5Dkz6RmEDOc9c7mRbqsh6en4Zh
	Du8bRl1kRAzvoNB3ncepCRiCXpiKHg1nNxFF2Yp+siMohRrMaqGRC/cVgBASo9kc2e+5HtnlNPI
	xXUu1YpqxHfKR0SH3PV59m8Gc11V/qW131yM8b8xmf5zFC53L7Ixc+14LwJA/td50TI41chhRCE
	5De7DJpnBqsm2CkdKG3W8MBSLhYeDHYujFwq0UPfiyY/SVH2AHczIheiESAJO+Aym6b2BkcZCy9
	sinOHohS4SSBfVLgeSTpWsgvA=
X-Received: by 2002:a05:7301:1884:b0:374:ba43:ae2e with SMTP id 5a478bee46e88-3856f65eccamr19954875eec.14.1795686782571;
        Thu, 26 Nov 2026 01:53:02 -0800 (PST)
X-Received: by 2002:a05:7301:1884:b0:374:ba43:ae2e with SMTP id 5a478bee46e88-3856f65eccamr19954861eec.14.1795686782067;
        Thu, 26 Nov 2026 01:53:02 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm60904402eec.23.2026.11.26.01.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:53:01 -0800 (PST)
Date: Thu, 26 Nov 2026 01:52:59 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, krishna.kurapati@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/11] usb: dwc3: qcom: Recover controller state after
 power loss in system suspend
Message-ID: <awgBe34JQQ-Z35kz@hu-petche-lv.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-8-faisal.hassan@oss.qualcomm.com>
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123104727.1539149-8-faisal.hassan@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX/k0irKYGEdIO
 LqKOEWDxWq0oladAML1Ki3Ngd4ETn6iJaepUgZHewwnt8WClNVMtNFW4bSWez8QftKZx2VrncW4
 xR+707I0Z+04M+gFdSqdwzY/ssy6LNAgugYwP+UT1LEORm3eVasF1Mf3Gek7Mn5jBZPyEmZK/CT
 Hyicdh5WLRtOSHXXM+w9myleuR/FcD6tIDWWRJDHNWim/Au98S17QS8aOonIxJ57KSs9Cvn1oFk
 NilqVN0CskTG/0Y4z6GctTm5hGVMn2pgsGqRv3S9OcZdKycVBBloRiDCWlndgkAGo0JaJ2SPSr3
 63/DBvBGtKTQcsg6D3khmxKNxvr9Hoo6QUueR4Gr59sYL3tIwAWaU7ItiabGdTZ+Aa8cT6VSd5I
 FHRvDVo8IM8ZZLfNaiDCB8M/NTjcMuEF/webpmuzB5MVENMeZN7pKzQmSljzotJ4A/CSA7D4VlN
 wYyUbqacu0Nbgo/6szw==
X-Proofpoint-GUID: oNoz0C7gfwRcMlqXPcu9205rqHMfoUU9
X-Proofpoint-ORIG-GUID: oNoz0C7gfwRcMlqXPcu9205rqHMfoUU9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfXwewrDDMn/Pia
 eYmcJZa0LpENgbHxK/dKbISRvMwo9iKwkpT3zQUHHLDdoEduY7eiUaLNk7IS9vd43CADVcdnEgO
 J02u1iH5Nt3/hpBGb7+YROWHbl2zkIw=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b08017f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=gQGRDXeGRSRt8_6BGQ4A:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038

On 26-11-23 16:17:22, Faisal Hassan wrote:
> On SA8255P, automotive platform requirements call for powering down the
> controller's GDSC and entering VDDmin on the APPS side during system
> suspend. The controller therefore loses all of its state across system
> suspend, regardless of whether wakeup is enabled. Runtime suspend does
> not remove power.
> 
> Add a per-compatible flag, power_lost_in_suspend, and use it to recover:
> 
>  - Assert and deassert the controller reset on system resume, so the
>    controller starts from a known state. Skip this on runtime resume
>    as the controller keeps its state there.
>  - Set needs_full_reinit, so dwc3 core reinitializes the controller on
>    resume, and xhci_reset_on_resume, so the xHCI host is reset as well.
>  - Return 0 from .prepare, so the PM core does not apply direct_complete
>    to a runtime-suspended device. The system resume callback must always
>    run to reset the controller.
> 
> This follows dwc3-imx, which also sets needs_full_reinit because the
> controller loses power across system suspend.
> 
> Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 47 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index e7fadad9a4e1..8e8d7e59c6d5 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -68,6 +68,10 @@ struct dwc3_qcom_port {
>  	enum usb_device_speed	usb2_speed;
>  };
>  
> +struct dwc3_qcom_priv_data {
> +	bool power_lost_in_suspend;
> +};
> +
>  struct dwc3_qcom {
>  	struct device		*dev;
>  	void __iomem		*qscratch_base;
> @@ -86,6 +90,12 @@ struct dwc3_qcom {
>  	struct icc_path		*icc_path_apps;
>  
>  	enum usb_role		current_role;
> +
> +	bool			power_lost_in_suspend;
> +};
> +
> +static const struct dwc3_qcom_priv_data sa8255p_dwc3_qcom_priv_data = {
> +	.power_lost_in_suspend	= true,
>  };
>  
>  #define to_dwc3_qcom(d) container_of((d), struct dwc3_qcom, dwc)
> @@ -407,6 +417,23 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>  	if (!qcom->is_suspended)
>  		return 0;
>  
> +	if (qcom->power_lost_in_suspend && !PMSG_IS_AUTO(msg)) {
> +		/* Runtime suspend keeps power, so there is no state to recover */
> +		ret = reset_control_assert(qcom->resets);
> +		if (ret) {
> +			dev_err(qcom->dev, "failed to assert resets, err=%d\n", ret);
> +			return ret;
> +		}
> +
> +		usleep_range(10, 1000);
> +
> +		ret = reset_control_deassert(qcom->resets);
> +		if (ret) {
> +			dev_err(qcom->dev, "failed to deassert resets, err=%d\n", ret);
> +			return ret;
> +		}
> +	}
> +
>  	/*
>  	 * If a later step fails, the wakeup interrupts stay disarmed, as a
>  	 * level-triggered wakeup line could otherwise keep firing while the
> @@ -649,6 +676,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	struct dwc3_qcom	*qcom;
>  	struct resource		res;
>  	struct resource		*r;
> +	const struct dwc3_qcom_priv_data *priv_data;
>  	int			ret;
>  	bool			ignore_pipe_clk;
>  	bool			wakeup_source;
> @@ -659,6 +687,10 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  
>  	qcom->dev = &pdev->dev;
>  
> +	priv_data = of_device_get_match_data(dev);
> +	if (priv_data)
> +		qcom->power_lost_in_suspend = priv_data->power_lost_in_suspend;
> +
>  	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
>  	if (IS_ERR(qcom->resets)) {
>  		return dev_err_probe(&pdev->dev, PTR_ERR(qcom->resets),
> @@ -741,6 +773,9 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	probe_data.ignore_clocks_and_resets = true;
>  	probe_data.properties = DWC3_DEFAULT_PROPERTIES;
>  	probe_data.properties.skip_phy_init = true;
> +	/* Controller loses power on system suspend, even with wakeup enabled */
> +	probe_data.properties.needs_full_reinit = qcom->power_lost_in_suspend;
> +	probe_data.properties.xhci_reset_on_resume = qcom->power_lost_in_suspend;

There is a xhci_power_lost flag support patch for dwc3 at [1], do we still need
"xhci_reset_on_resume" or could totally re-use it?

[1] https://lore.kernel.org/all/20261125181116.121-1-26rote@gmail.com/

Peter
>  	ret = dwc3_core_probe(&probe_data);
>  	if (ret)  {
>  		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
> @@ -829,6 +864,14 @@ static void dwc3_qcom_complete(struct device *dev)
>  static int dwc3_qcom_prepare(struct device *dev)
>  {
>  	struct dwc3 *dwc = dev_get_drvdata(dev);
> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> +
> +	/*
> +	 * Resume must always run to reset the controller, so don't let the
> +	 * PM core skip it for a runtime-suspended device (direct_complete).
> +	 */
> +	if (qcom->power_lost_in_suspend)
> +		return 0;
>  
>  	return dwc3_pm_prepare(dwc);
>  }
> @@ -873,6 +916,10 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
>  };
>  
>  static const struct of_device_id dwc3_qcom_of_match[] = {
> +	{
> +		.compatible	= "qcom,sa8255p-dwc3",
> +		.data		= &sa8255p_dwc3_qcom_priv_data,
> +	},
>  	{ .compatible = "qcom,snps-dwc3" },
>  	{ }
>  };
> -- 
> 2.34.1
> 

-- 

Thanks,
Peter Chen
