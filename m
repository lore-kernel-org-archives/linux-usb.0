Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793601381;
	b=NVocNTmtVvLPEpn5bNTxcjONNStD5kNVG2WnxwK5rbl9XvUePEfCf0++KuG4DU5AGMeV
	 EnSna54EGMQQAIJe5Oy03btq7HK9RyPAdoXrpgClv0bt9gNK9PKPy3Z60la4NWYkjDhll
	 wJNq803aQs2sA2rPRxTeDuWsLz2+VvGpgOZlHfTk5+Rf/tKW6DQ0ZZONNx4PRNn2n2CTX
	 Wr918wrVoe2zy6d9JJQo8k4LnNyxgrt14cMqNmwzArXUU4Jcd7X8I+raXQH7y20pj3jMp
	 KBffMtQt512ZvWAC2eYEk+Duveb0su3Z8nrXWO0bnBRv5cpuxMrISfMJY1Mma4u5pbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793601381;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FNgNqTqkeVY9ayKVbUhSJOCwh1lLbqAoM2n3eAI1HTU=;
	b=LmLTZPc00eIIZF764gCMewzT1MsmavaU552ZtU0zXTfnIziVvLZNznxZc49IJmTFsF0V
	 qoMd2Gv5Y6fwAjxaRWKJgI9009OZdytAJBNNZygeHahrA8cIMIfv6c6p2+IwUHMGBZq/W
	 e5hT/YaYC43eFO/BjR0ufMFKmBtktob4q3qVkv/JwzU/4U8B7ZAqyQycQ6ePj14QyMdCu
	 TW8GmfKo3RJXN80NDKmXqxYIFVRLrKfzS0Fn632bqAOjGKU0QI9cmnYStu6X2zpOP6X/Y
	 iRbl5C7wUkqORdirw7HJA8MS45/euQgqHusJNRdbR5Psnz0H8uqty54cKLHOrIc4UAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IWkMDN19;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STC+iUm2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF28606A326
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 06:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF28606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IWkMDN19;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=STC+iUm2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vKxD1676184
	for <linux-usb@vger.kernel.org>; Mon, 2 Nov 2026 06:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FNgNqTqkeVY9ayKVbUhSJOCw
	h1lLbqAoM2n3eAI1HTU=; b=IWkMDN19kV++YBbZMUAhz+I1I/lDK3Z6w43RDED0
	nDnD4Kk0JLUisYhJ78wK41jYqE1IC98hzX0uoDfGkx2kRg/sgqWi6X/v7w60Erzu
	ZPGWzVcOFMdCOWKWU2B6nwqarnBVjDHvQgWcOhGsSYw2kWPopPIkLIPwkrhb4ZEY
	dfzd0tSI/u/xFhMT+JXGy3wO+p15t3mk00WeN9L9/ohrkMVk7vJqmzVhw4Atw7rE
	JCF42hzSWIt0Zg/8g2Rhj3zdnIXhTuTHVhr0Q3lpRl5hhHGlAphW6zn3R+Ja5wEH
	QnnLE3QDAnbhV9fGwp4bmCUIko70yP5J4cKx+oi4/gII5g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7wfd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 06:36:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so3829925eec.0
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 22:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793601378; x=1794206178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNgNqTqkeVY9ayKVbUhSJOCwh1lLbqAoM2n3eAI1HTU=;
        b=STC+iUm25DRhs+RRCDCJ5xvKil/a3zzIAL1KQXQaHkDWtkLGJmfOVj1frgNc3kvEer
         a72kRq4o3wmKZpFjNibzlRSzIoq8+DEs9jBekjkDSnFLqa2g7f+lkBVhOJ/Nf4vgtBCW
         /eDo0pbHMAXSlGVgo2L7ftzIOwipdWp7KnSSbVB3UHy9aZU+4NaIpYVokh07bozWQp5W
         9/5MoGm4YTe9sERprvWlt8XqXvADTalGdw0rCIg6WXlxQpyFE0cHktYH5DBkEAynsLLf
         E+eIymz2PigViU6S3YhN4BMXBMHmvlPzZlKayqsiex1xM9vByVZ46G0hJM1KBVFlvhpe
         UWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601378; x=1794206178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNgNqTqkeVY9ayKVbUhSJOCwh1lLbqAoM2n3eAI1HTU=;
        b=be9y5HPzyk0pB2YlSx9+d8+wJJnQjHPNRu1fgVPH3ORfYJtaY64RgVjPSnfNTvwU8F
         KPkxBlGDddAwBGgoZn4SErtITEzasx35rfANqJnGFsmAH+pgEy1axEu2uDgv7+vNVNAm
         6M7AsgdhYGmhHZRVF4Iwy6o+6ZEPmkDrd1cq50rL0oj6cr9LxieZSJBVzgyG/zRTQ8Y9
         eRj02GJhlKmQ+XZRBS5cWe4KD7SrMClbOMQJ257G1Rcql0cAde7VyLjmyIKtdBgZXc9B
         ZXopXNbYAG8qMLYwbze14UYcbaxplEPl8LWCHPBgP3tA1y8nMzuhbXKhE6UHfp8tGQDc
         ZWUQ==
X-Gm-Message-State: AFq9FYLZzRsY9aV65Ad/hCNMuEsRzRQGDmJOkocNh/lP9rVZr76vXq3w
	WpGVm2YgdBP2rGsFJwnet1lAiQlcSoWz2ZyF977Ay7na92pLCW6NO63YmwwN7Gk3d65OSRYGy3r
	rE3iowBlgvbT4FCsqF0x63q1NihaAjEiloOqmmkJZSSfBEHQmaHAE8jEW/XXkV6TZTAiejFuvjg
	==
X-Gm-Gg: AYBFou19jScPMt1ow96Llybcp6v316otxR96Jp6aZXAOk9uh22gmk3QC4kXaWnKljlu
	uUMr1/UzZZqXDsPwMa2fu6i1vjZJD1kkHYe+FcYxFDJVKwrQq3trF7xLdwou+ZAYynZ6D3u5A8A
	pj5tA1nSPPC+iMU5av85r61EHBkxO7VC5DrNzsU5BMn4J1T1Cr6rOhXoHuDC65RPhRwBC/vU0cv
	+OIRe7q3xwgwKlBqnmk+2R6IGFyYwaOMkZAwSveTvcCbRhLm+raFq3CSG7sd7hxb0L8mQTYXCpH
	qZSVheHOJWyG/e6xvVkpikqs1ah/k3q93QEOLfkKeGvPHeoNClQD01881JhDx37X76gVbLg9kzV
	hV+oHosBxoPaG/35X/6GFO1io5vSwAvcFKIDs8Fo2JBVVJjqG3UrkYImjRmbqThxXLGNd6BHWVX
	Zdd8SMxfvgIrOm9cjt2pRj
X-Received: by 2002:a05:7301:53cb:b0:35c:e696:2d4a with SMTP id 5a478bee46e88-36a423ea99dmr13280577eec.24.1793601378270;
        Sun, 01 Nov 2026 22:36:18 -0800 (PST)
X-Received: by 2002:a05:7301:53cb:b0:35c:e696:2d4a with SMTP id 5a478bee46e88-36a423ea99dmr13280533eec.24.1793601377560;
        Sun, 01 Nov 2026 22:36:17 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1dfsm35915433eec.7.2026.11.01.22.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:36:17 -0800 (PST)
Date: Sun, 1 Nov 2026 22:36:15 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/7] usb: dwc3: qcom: Enable VBUS override at probe
 for default peripheral role
Message-ID: <augvX4NwBcJot_AF@hu-petche-lv.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <3c1778a36380bb6d9123c3791f15cc3656b80145.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <3c1778a36380bb6d9123c3791f15cc3656b80145.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: -SZ0Ut4daBPVdvc1SXCFU7kzI1YehrXO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX3gtWfsIMJBOU
 CXcN5U6vlUVi21VdeRfXbJT6vr3poFQZLd15eoBM6G1BwTH3PeNjR1cnUZ1p4Bhqem/H3wL9zsw
 PViT1TVV+LqIakpxLMRjLw9ITpp5lFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAyNiBTYWx0ZWRfX0jRh1U10Jgux
 WRiU45GXUYD++vNSKmDCvuxdTYyzdOXP1lyBi4bBgbuqnRVbENaLOsqPbYD1sn3SSRd4WaDlEX/
 ph8QH9i9raCGz1dJVXUidUJnP05v42fcFmHKP7AGv6IaGRn4br8xVBHn6j0EOyI0td6J6Mg8G5o
 R7Zxv6L8zE+bCR2PlCfIeBRNoS3KnWSo56lX9SPW4RIFL6yhYq1JtpaOWK8zXXLVOinkHiztSGH
 IMu/gXer6E8EkBZSzwE013nzmJSyI8RWO3DBIrzZgLaZ9AKBgcaWGp8C7hz1M9L4MAaxpRNBpZS
 jwfZFR1vPcwEazyhSsv6PJK2bOmhcAPoBtgzMswk2Yl7RU4rfhneDBHtcrv2OMkiyLyLAj0Nvz6
 vFszzGfDOW6jaL0vS/tUSmZTny67SLcQRDRWByhlmT7aQtbLPPAJyqIWX0f1A6WIAism+XIF9QM
 uwet2Gx7SGThUK7ngdQ==
X-Proofpoint-GUID: -SZ0Ut4daBPVdvc1SXCFU7kzI1YehrXO
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae82f63 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uiTGAi7-L7myVgi5AJsA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020026

On 26-10-29 00:29:37, Faisal Hassan wrote:
> When the controller is in OTG mode with usb-role-switch and
> role-switch-default-mode set to peripheral, the role notifier never sees
> a transition at probe, so the QSCRATCH VBUS override is not programmed
> and the device never gets a session-valid indication.
> 
> Enable the VBUS override at probe whenever the initial role is
> USB_ROLE_DEVICE.
> 
> Validated on SA8255P with an HS host attached: 20 unbind/bind and 20
> suspend/resume iterations completed with no failures.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 0896a323bdda..92f1223f7b21 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -953,10 +953,12 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  		dwc3_qcom_vbus_override_enable(qcom, true);

....

>  	} else {
>  		if ((device_property_read_bool(dev, "usb-role-switch")) &&
> -		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST))
> +		    (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST)) {
>  			qcom->current_role = USB_ROLE_HOST;
> -		else
> +		} else {
>  			qcom->current_role = USB_ROLE_DEVICE;
> +			dwc3_qcom_vbus_override_enable(qcom, true);
> +		}

How about move it and above [....] under device role, let above code purely determine current_role:
	if (qcom->current_role == USB_ROLE_DEVICE)
		dwc3_qcom_vbus_override_enable(qcom, true);

Peter

-- 

Thanks,
Peter Chen
