Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795750041;
	b=IGjRUvqOSxyoqWObP8mh6DY9iqHmJvJghMYci5XczXWehdf/egFNkHqEhj+v3PEwxPr/
	 Z801PwVqxWWrCPlAxbI1gjQvQgER6ALJE6DTD6mP3Bf2tttZcnNZ+OGzhSW0iaHAyTjua
	 x+OLS7OCAZ6s/ANXK3ZcNH0zg3N3ngQ/z+j70DtOUAfw/IwpLuT3Rd+LCvS5yk/pNolFU
	 ImXKDI9MwbV2JIcJwxzrr/CwKhGO3NCafAk8edu0HIFNeepq1CJK+yzVsZk513tSRWn+T
	 3zR3jRRpvn2/YFg3UGBM/vOC2ifAI2lfSwMccuNujpB73K8A+QXvgTbxKWMQamPzWOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795750041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lWjOfWNHNdRxPfF8k84mdElHbK5NDVQUwa7j1kPx5vw=;
	b=I+ZkgGPu3fQdfaunn0tEPVN75DdP0EugsSBYHtNhnG1bu7B0XXre7BH4N+p8UlThdNNo
	 h/rMI/9PWud/aMJUrtTBYHOmoRmaWhnMkK67PbyTkR/jE8KzmUl0uUViMjEP/66HouU+v
	 sufORy+TlWEUPntDfjSPg1BNv9beV4A1FKc9uwg7b6nVL+0Ph/xOIqWZyWWeC0uFT/T0/
	 o9GUQAhle/i4j7MLR5zrI4iZ+Rk3kkerBC+1TbtWgKpGUwgWLq8hyDqDZ1ljpTx9a4rIz
	 tfpuJOxAVNsrUmF8P0EOoi9rRcMMhadYh6AVtueqvq1700cC1JR82IHTswtDinqihag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dV8RB8ec;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HxZBYfH9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB187606A321
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 03:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB187606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dV8RB8ec;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HxZBYfH9
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJw8ZI781864
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 03:27:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lWjOfWNHNdRxPfF8k84mdElH
	bK5NDVQUwa7j1kPx5vw=; b=dV8RB8ecrhzQSjUR94UL3XVZzpiQdqU1P24NrI2v
	x6IwxvhylGK4dIsN8apuPYG5pbRcOTF4Uemvye95Cp1FdOpoSbfnM24eZKzHeee0
	iWnq8ZEkrI7lWRqNTerQNQNdD4b4br3ciWDrq8QWYUZqIffWtWUMlUtDKnHAp+EM
	tW5MMGtz33mZLodP/+C6yFKmL06gTDfHVXTtjmowQPQ3vgjxsgEToDHFIHs9CVf5
	jnKzapbUZecpD72ny+JFnnbXqPJSHMoBsMLnoDkg4f00D1i8KvswPNP7XUBrQOpl
	BzRZ0SBy5ZO/8CJC58qjeNRMDV+PeWHchZjTw9Sthun2wQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm833rc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 27 Nov 2026 03:27:19 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so11053500eec.1
        for <linux-usb@vger.kernel.org>; Thu, 26 Nov 2026 19:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795750039; x=1796354839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lWjOfWNHNdRxPfF8k84mdElHbK5NDVQUwa7j1kPx5vw=;
        b=HxZBYfH9G0k07lU2nJ8LUEVE1TW/zGFklLxlF7xmTgB2GWxv0fbkf204JXHWv0S1Xp
         0YZRLcXCm/w1qeyIfRvcnTCWkZURAWjVVIth9CDSV7vJ4rTfBRMLj62SoUfa9FpHBJ/0
         hueLtxYpg9DZwzoHWLAqb+E0SVpt8ppiLhuAYuA8ZXZIZivGdA6c0jWemk5XxI+YG2L2
         DQuJhRfSa6joV0RR/TGZVRCxRxwlIFVAdkZ0/xDulKG6COi3C7nR60erCeDIZq9lULZi
         Ypypkh9PxqXcURI0IqSuC9bWPwGv4wINdo2LQP++qUIMpe+0+bCUZ0Nu7krWcBisy8aj
         RvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795750039; x=1796354839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lWjOfWNHNdRxPfF8k84mdElHbK5NDVQUwa7j1kPx5vw=;
        b=oRe4eO4zRtIxRkWwx3n1Lf8CB4F3uwRU6c5KR3ISu0R4IogvlyeMtLyRBbOHXDgWC3
         CxKh11g04GX8/FZIN6wB3XU4P6iUpfg2UimY8sq/Bus/TJue5+DOAgUP2vnRf6eAUakx
         /057kSpk6QieSj/xDLkMVhoFHJMzgErZsC4Y/+UV5CTx826Xnhg2vPm+T5FYpxmC03nx
         fVuarm4w5I76ZfisFvmD+WGN2NzR3VTFG89cvbFNezWtmdTYJSUPynLAgDXF9vPxZwMd
         NzcfdztI0qLCXtYqU+zZL1ibUEIyBH07tF7eYJryJFwITl57skxTsN/26DiGFOYE3XhA
         0t8w==
X-Forwarded-Encrypted: i=1; AL+hErGghxeacV1VMDVOWQiIf2xmB9qh9AYaB9Fb5LdsKA3PmTvQ6CouqSJ67r50fWW1SrbuXctvj7m5ayM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a9aZKSlSRz1qxJ/kfkYlmEalL82JZPnSsRv6Ii5AICww/GBMk
	aXwBOctNnxG/48pTvCyBtwJFQzTPzJsOG4LyqPbQW0L725EmgefDdNjmnKunDXbWuYQRL9xJ89j
	qCVMv/RZ/jwb3fesZY279qw3QMsciXsvHsc8IuCnRyA068XryegQAlT9l0LYXxuo=
X-Gm-Gg: AZFdTZcnACi/ZgmUO/gKs5dRdLpcrg0YWmpGNAOnNTW+NxamJTbmAG7TUBlNvHxnSu0
	ZMoHjK+kGgiGFelqj72kP7ANzITIwn0+ZZbnStE1PwTA0ykE18NdOYyBNiFYovU0BbvOYh2HRmZ
	ZYKSFMnSSCcMW//zUGcec7hF5N3oqsln6GyH4f6xtpa3b7UgHaoUOoHPl1mqcee9lsgOEDU8Wxm
	EQjff6dqU3pDiyh5n63rPn6+gKkNDMQK4o3O3dMej8Rnd2+ai6wakbkhEC1BNlBHKb2VDGAwH18
	okNSgkgaeOdachBUApWjPyYjqId4PnZx2drFzMIOCWziJhrlTFPEyL62AnEry2zFETXH8t2oDFa
	tdjDuvfwGF5u2JZ93/BRhTE5GsraiuBdcshbjkoP7T1ZGkEtuWSLXHLMWlUWxT4cZa31KmshvSV
	/xATKpv9Qvj/dmqriZMPLM5XA=
X-Received: by 2002:a05:7301:e0c8:b0:386:c724:cc68 with SMTP id 5a478bee46e88-386c724ceb2mr8473564eec.2.1795750038538;
        Thu, 26 Nov 2026 19:27:18 -0800 (PST)
X-Received: by 2002:a05:7301:e0c8:b0:386:c724:cc68 with SMTP id 5a478bee46e88-386c724ceb2mr8473542eec.2.1795750038026;
        Thu, 26 Nov 2026 19:27:18 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm70364105eec.6.2026.11.26.19.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:27:17 -0800 (PST)
Date: Thu, 26 Nov 2026 19:27:16 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: qcom: Add support to skip phy management
 by USB core
Message-ID: <awj4lKkHFwticf_d@hu-petche-lv.qualcomm.com>
References: <20261126-xhci-skip-phy-init-v2-v2-1-004f9c5597e5@oss.qualcomm.com>
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
In-Reply-To: <20261126-xhci-skip-phy-init-v2-v2-1-004f9c5597e5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: G70dv-yU5fZF90Z2X2Kmom-YlAa8xvGF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAxMyBTYWx0ZWRfX3gbMPb3YxQfw
 RNd5+piH5ZP/BgHKqDp6QkkVz4kGjZQ1v1XlYrfz8um3nl0pXrUWWpiqygRFAnKuSMhQ7woBWZ4
 uzOD2ZlaSxbvrQItG2/P/NCPtmldFYw=
X-Proofpoint-GUID: G70dv-yU5fZF90Z2X2Kmom-YlAa8xvGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAxMyBTYWx0ZWRfX6P62R/fDaa6R
 mOCAGfX7EKCKpD3u1DeXrIkL/WoXwAwNdwWnzrct4TuuYzgE5k7lyEwQw1KrmeN9FGYK43+02eS
 zqRPLcYARaR+xjzVQwFQ9IQWvbMsHjoL8GUsPhG2MWI06uDt5PXJzYWGHLMQaGJ3/lUdvZlHW1c
 PhvTUsKIv0Ra3ILrTdYQEeD+kYHLYTvPcDUf3Yijt43kf/KMr9cFvtMvSzfN86PVtgckvBy21rz
 VAXnqTKnw2TZvw5YiaT/Edbqvmm0x5SfwJSOEwb0nqKvtyYS7v70nafOsSRspDnCbq8LUNML4DV
 m7m6J+phgp1wY+fDsLHWtFYjXD7V5mp2zQHqSZPKPSUytbmstnBbM3y0/lsQG/E0qQWAlT8v4yo
 p+zMdaXLntfbumlWRoljxbHO1BpCbzhZSlJR/Sc3DVkBM/r4OmSRdEJwEpzg5Kwd843heWUabru
 eNXdOlaWgZDyBh3FEZA==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08f897 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=k3uclAftMG0p3JNzI7AA:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270013

On 26-11-26 22:05:56, Krishna Kurapati wrote:
> DWC3 driver does manage phys itself sufficiently for Qualcomm platforms.
> If xhci-skip-phy-init is not set, the HCD core does a phy_init and phy_
> exit is done only when roothub is being destroyed. Due to this, during
> system suspend in host mode, although phy_exit is done by DWC3 core, the
> init_count on phy is never down to zero since HCD core also did an init.
> consequently causing phy's exit routine to not be called. Hence, add
> support to skip phy management by USB core.
> 
> Some Exynos platforms still do rely on USB core for phy_calibrate calls,
> hence disable USB core management for Qualcomm platforms only.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Peter Chen <peter.chen@oss.qualcomm.com>

Peter
> ---
> Initially, a patch was sent adding software_node properties [1]. But it
> was causing a bootup issue as mentioned in [2]. Hence a revert was sent
> to fix it [3]. This patch uses a different approach as opposed to adding
> sofware node properties and was tested on sm8750 mtp.
> 
> Changes in v2:
> - Rebased on top of Thinh's latest patch series [4]
> - Removed Thinh's ACK since code changes are different in this version
> 
> Link to v1:
> https://lore.kernel.org/all/20260914-xhci-skip-phy-init-v1-1-9c46b31a5a39@oss.qualcomm.com/
> 
> [1]: https://lore.kernel.org/all/20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com/
> [2]: https://lore.kernel.org/all/cbb4ae94-7862-4d91-b01d-0d7f18d49a45@packett.cool/
> [3]: https://lore.kernel.org/all/20260909-xhci-fixes-revert-v1-1-7cc97fa0f307@oss.qualcomm.com/
> [4]: https://lore.kernel.org/all/cover.1795559405.git.Thinh.Nguyen@synopsys.com/
> ---
>  drivers/usb/dwc3/core.h      | 3 +++
>  drivers/usb/dwc3/dwc3-qcom.c | 7 +++++++
>  drivers/usb/dwc3/host.c      | 5 ++++-
>  3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index d103a637a4f7..9b9714fdba9e 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1139,6 +1139,7 @@ struct dwc3_glue_ops {
>   * @usb2_gadget_lpm_disable: set to disable usb2 lpm for gadget
>   * @needs_full_reinit: set to indicate the core may lose power and need full
>   *			initialization during system pm
> + * @skip_phy_init: set to skip xHCI PHY initialization on host init
>   * @disable_scramble_quirk: set if we enable the disable scramble quirk
>   * @u2exit_lfps_quirk: set if we enable u2exit lfps quirk
>   * @u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
> @@ -1408,6 +1409,8 @@ struct dwc3 {
>  		unsigned		usb2_gadget_lpm_disable:1;
>  		unsigned		needs_full_reinit:1;
>  
> +		unsigned		skip_phy_init:1;
> +
>  		unsigned		disable_scramble_quirk:1;
>  		unsigned		u2exit_lfps_quirk:1;
>  		unsigned		u2ss_inp3_quirk:1;
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index ef38308023aa..3fe2e0fb3eb7 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -636,6 +636,12 @@ static struct dwc3_glue_ops dwc3_qcom_glue_ops = {
>  	.pre_run_stop	= dwc3_qcom_run_stop_notifier,
>  };
>  
> +static void dwc3_qcom_fixup_properties(struct dwc3 *dwc,
> +				       struct dwc3_properties *props)
> +{
> +	props->skip_phy_init = true;
> +}
> +
>  static int dwc3_qcom_probe(struct platform_device *pdev)
>  {
>  	struct dwc3_probe_data	probe_data = {};
> @@ -745,6 +751,7 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  	probe_data.dwc = &qcom->dwc;
>  	probe_data.res = &res;
>  	probe_data.ignore_clocks_and_resets = true;
> +	probe_data.fixup_properties = dwc3_qcom_fixup_properties;
>  	ret = dwc3_core_probe(&probe_data);
>  	if (ret)  {
>  		ret = dev_err_probe(dev, ret, "failed to register DWC3 Core\n");
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index c5674161b2b0..3fb8be8be590 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -130,7 +130,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
>  
>  int dwc3_host_init(struct dwc3 *dwc)
>  {
> -	struct property_entry	props[6];
> +	struct property_entry	props[7];
>  	struct platform_device	*xhci;
>  	int			ret, irq;
>  	int			prop_idx = 0;
> @@ -174,6 +174,9 @@ int dwc3_host_init(struct dwc3 *dwc)
>  	if (dwc->usb2_lpm_disable)
>  		props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb2-lpm-disable");
>  
> +	if (dwc->skip_phy_init)
> +		props[prop_idx++] = PROPERTY_ENTRY_BOOL("xhci-skip-phy-init-quirk");
> +
>  	/**
>  	 * WORKAROUND: dwc3 revisions <=3.00a have a limitation
>  	 * where Port Disable command doesn't work.
> 
> ---
> base-commit: a431ab75251f0ae5b7019efe7221b851716c2c3c
> change-id: 20261126-xhci-skip-phy-init-v2-6d0b35508b0b
> 
> Best regards,
> --  
> Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> 

-- 

Thanks,
Peter Chen
