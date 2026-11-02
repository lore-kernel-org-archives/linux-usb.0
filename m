Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590338;
	b=t3CYnzYEdpwWeDaJ5DPx7FHW0Q0BKak9CHkRM67y3aIuy5myFLETO+9/M+LxSskirIqq
	 uKdb0sovbj07BSkFV6M7oentNzJkyCNz9eISksJTc66JFC/HxWk9aV/lh7VfpOPMabn0k
	 4MbWOpbr1svUh4JCRipyD7qNNn127eJeruQqoMwbH+c4ohbaoxGYef5XLNFqzIYfK9wUz
	 XJdROjupVVTxmvS1GT6rtacZYL1ynGk0BX5IPeyzNkxR8aGzD+cJjh50U7KAHR+eNGLS+
	 bq4hy8lz7aPnpI/IITvcQ5bkfk9qilcZinPcinou5svPXjJSbranSW51E+D/HsSXdPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590338;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V4Vra6fQtcjS2bOHJ4vISu/T87zL26GOtMaue5+rq5I=;
	b=zwk56U9u5FGluSXQukCVJ8L90iB7pgxfPU79RdgHXRb3a9ipOib0PtxA92JsARCgEl5h
	 Ujpd+P3OsipThEW+kPr7fc2vSH/7egS4qo2fUkyfqjP93+uLu68MppTsPbtEs9MJiusJQ
	 WNXxJTb+h4oDT79JeQ9SsRnCJR5NhH/AjuaudtR1tQs202BSFHh2yE6sS9S+82yy4HWJo
	 vxiLEirVS6mxpTncPYWkgjHiWDxaDwGWD5jwvSxMM+uFwWNq0pnZSjw+7rLJSa+YPLS1u
	 Y292pICs/5LaOV1cfo4MnDQ3P5pCJrlLuKAdZVIGCKPe+mCgy5rXtcQhefrQAjJM3+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Jtub3uo/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V1WkYBda;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3EA606A32D
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 03:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB3EA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jtub3uo/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V1WkYBda
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A20JrwV2256241
	for <linux-usb@vger.kernel.org>; Mon, 2 Nov 2026 03:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V4Vra6fQtcjS2bOHJ4vISu/T
	87zL26GOtMaue5+rq5I=; b=Jtub3uo/eIAoGU4zHgJ4tpO6pWa9BHZJ3HCrlOg1
	fp6ewqqjBikhw41zxoPNCazflbBMTq4AH2vnklMiDWwINzfxU4Uorj2luR+LbfFl
	ppjzUfXNNLtukv4mkqkg5KDPoqktKpsPVAilXnXi2CtdYjBlxoq+wJR4bE5ZvAis
	0v6jgKmBqE+fM43oZOh5hIBfcr1ihqICwbwHxdTPhZiUr/YNtU9Mp3Nsz0dGML1r
	uAilxBiM/x3DBuMaIs9o7WFQfc9zvYjIwGe/B3CZn8/pkZNz1WAh7/o0+ajILbGv
	pdC0KLKfg5EIkFZRvnL61a4mDZBshPskz21YDAh9qUGaug==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2w0df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 03:32:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a1e2485fdso7089509eec.1
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 19:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793590336; x=1794195136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V4Vra6fQtcjS2bOHJ4vISu/T87zL26GOtMaue5+rq5I=;
        b=V1WkYBdaGilv8yNeBa9rm0X9T9yFa6coXaVXwf1bdOOz5ZMYyYsX5cfQeY+BMVQkHl
         iQJZKoLMnl5Se2L6/9qynHRI1y1OpvrF0Hcc/yfAuuuqXI1v3oYqKpX2iuS9iKUhdMVh
         ETSD8q1OUuZmDfzVgqitQp8uujwSWfgirzjxyoWXFME4JhOxlDGQrBjZBMN8iTW6eUE4
         b+PHgLNJhzK7OW110pllHVMgnNUfW9iYSzunDmAxtCWblG5kzo9O2gaeSUP65DVZd/kE
         1jZxRRMyBunMSqlwD7Veo7/GpVipNj221llzSQNc3Jm3bAlVkX4on8v+U1hvYbHZCrmR
         lhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590336; x=1794195136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4Vra6fQtcjS2bOHJ4vISu/T87zL26GOtMaue5+rq5I=;
        b=Zu39ww03OI/kcSEudYaRBKL2NIyONYaf+NTQ904cX20h9FcTHwLUREImDUevUzwoEX
         KbRyK/dscF144p6zwOi9+px7pRl28pqUS5AA/hQjs8V1GmKidl6RNX0VYuDoaeYTIItU
         1Op/BkvzYlG6LLhD37V43eSTw2CQbV9LlTepJNDbaNyogmtTP309KbIQBw77ZCxeU9pl
         hz23jhmsuu9nbecr/aXDrKgPujbYohukPqiBOhQLR7nwoF0G0Bg+k/ZynKdeHlFIifIw
         5MwZ4GHj7XcKFm5maaxteShPhG5BuAtStABfEVyVxgsJbUEDfJHBKFcE5aEENpCzl4fb
         MoPQ==
X-Gm-Message-State: AFq9FYJ90MxU5Pouv84kcMyt7qEZPJ2tF/rWlziRFXiQCLDv8YLtX4TR
	vrk2bzYIkBXPYvIF72WikcZzXTOq6gfD60IGm3zw/JzsFwssrKSNH1CHdFxnG/fLJvCl1yam2Rg
	M4RzEgq7nA6CqKQe98otJULbF+AsJjqqMqoE2Sk5x+K1EwZLnYhL+7ZUvMiK/FTE=
X-Gm-Gg: AYBFou3tAZmQYstbNc6ko8NyKEDYhMOj9vptoS93N6uTvReM/9MtvVUPkF8zsMY6Fhp
	GT5XbnWsaN9Bu50s+PXacZu+Pl3Mfpyf8s5vlHKito27f7/6pfjwmeYfyFlbB0p11pzIi/0zGQu
	dFz3fL2TeKB2biK7dFyG1Hgjgzoxv/TcT8Tas5TUD9jAxw7zbRyccIxGEr51RkQkvVADxLEAYVr
	HWTYTzkRPGrbu00koDrsnuZ3UbJhbNxP/ioDwNBftz8rVtjk/LaJv7yvyWdj7N88GEchZeGAv7M
	DYfh/1ukAAR9ru+soqEnLnHK13fzny3F7/0sedZ8DyjHyqy3JXPc6MGv0UPZcay04K7LHdxrkS3
	Dy3zwVOgM5doq9TJogX5g7vjLvNgOR8sAGWdYyKhnIq8Cnk+8CLNcgXDw8wR1us/HQMS/8pm0RY
	rwrQotD3M/vs/jhhkyUsaW
X-Received: by 2002:a05:7022:1108:b0:199:4f68:7710 with SMTP id a92af1059eb24-1ac55774becmr11915334c88.2.1793590335772;
        Sun, 01 Nov 2026 19:32:15 -0800 (PST)
X-Received: by 2002:a05:7022:1108:b0:199:4f68:7710 with SMTP id a92af1059eb24-1ac55774becmr11915309c88.2.1793590335163;
        Sun, 01 Nov 2026 19:32:15 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm27427782c88.12.2026.11.01.19.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:32:14 -0800 (PST)
Date: Sun, 1 Nov 2026 19:32:12 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 5/7] usb: dwc3: qcom: Support broken suspend for
 SA8255P
Message-ID: <augEPIcTyepgTxFW@hu-petche-lv.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <3a4bdffa9101fa81e4511d84c5a3ddd0b972efe2.1793212717.git.faisal.hassan@oss.qualcomm.com>
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
In-Reply-To: <3a4bdffa9101fa81e4511d84c5a3ddd0b972efe2.1793212717.git.faisal.hassan@oss.qualcomm.com>
X-Proofpoint-GUID: sQWCQYJ39DO2VT0pcsanL8gC25jxUNRE
X-Proofpoint-ORIG-GUID: sQWCQYJ39DO2VT0pcsanL8gC25jxUNRE
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae80440 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=PcBk4QqV-VHVs7bFY3sA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxMyBTYWx0ZWRfX0Ywtgw0nH9Fd
 ZTrRcZImaDonJi6yzzOsxx80hAXAprYKBwXm1ebPZW35XhCXAlWRIY076KHl88Yf+ASBT3KLWPF
 rNBfVrq4J5lmQAxV6R07NBi16HdIKXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxMyBTYWx0ZWRfX3ZIw5nxSDJu+
 oizetP6Ii9V/MNP5JU+U0aB7f1d3NshgM9zfHrNExqLWjb0KZ1IexBNltOJYCJVvYIW2svpOgpV
 TCJFNRAgClyZtlowS2/ZxIhuRSZD6dzB51gHX2jshqSzi38CMiQpJTh4PNSqyX7nqUtZOxFZwVX
 5hE49gbkV9vWj0sNbIfNRD4WTvOOndSK++p49RGeaX4p93EodcjDZOCqyCxClzIcwa6UFPfOUQr
 27tlCxv0eUqvAxnV1j6OxgdiHbkB6DFAHG0rGMv++ilpFmPDOIfeYMo+PXXHqA+K3HFF1Pzs/g1
 lGVpYgJbuKegTTXv5FCY+YdUuS9k8XrAoXiR9jKCSY3jcp4ip9GWzRnZr0n+npP+yMCRFiU/WSz
 ZSyrYE3PFVwZYfs0bvHgI1hZDtixoit+jrmWhN56axwCGymh6aE9msWgEe3UAyx6ZuLdQEF+qM/
 3ubPJGP/g2WLbIF0xCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020013

On 26-10-29 00:29:35, Faisal Hassan wrote:
> During APPS Suspend, the clock controller unit disables all clocks
> to the CPU and subsystems, causing the controller to enter the
> Power-On Reset (POR) state. This results in the loss of
> Qscratch programming.
> 
> Upon APPS Resume, the USB controller does not have the proper
> PIPE_UTMI_CLK_SEL or VBUS_VALID. Hence, if only the High-Speed
> PHY is used for a controller capable of SuperSpeed operations,
> the controller will assume it should use the USB3 PHY and not
> the HS PHY as configured before APPS Suspend. This behavior
> disrupts the normal operation of the USB controller. Similarly,
> if the controller was operating in device mode prior to
> APPS suspend, and VBUS_VALID signal is not set after APPS resume,
> this will cause the PHYs to transition into the suspend state.
> This behavior disrupts the normal operation of the USB controller.
> 
> Address the issues by ensuring that the PIPE_UTMI_CLK_SEL and
> VBUS_VALID are handled properly after the system resumes from
> APPS Suspend. This is crucial for maintaining the correct
> operational state of the USB controller and preventing
> unintended suspensions of the PHYs.
> 
> Also, as the controller is starting from POR state, make
> sure the controller Reset is performed.
> 
> Because the controller is reset on every system resume, the
> Qscratch restore is done whether or not wakeup was enabled, and
> dwc3 core is told via needs_full_reinit to fully re-initialize the
> core on system resume even in host mode with wakeup enabled. Wakeup
> on this platform comes from the PHY interrupts routed through PDC,
> not from the controller staying powered. VBUS_VALID is only forced
> outside host mode, matching what probe does.
> 
> The XHCI controller is reset by the same event, so also set the
> xhci_reset_on_resume dwc3 property. dwc3 passes it on to the xhci-plat
> device as xhci-reset-on-resume-quirk, which makes xhci-plat set
> XHCI_RESET_ON_RESUME.
> 
> Also make the .prepare callback return 0 on these platforms. A
> runtime-suspended device in device mode would otherwise be left in
> place across system sleep (direct_complete), skipping the system
> resume callback and with it the reset and Qscratch restore.

Faisal, there are several issues in this patch, would you try to split them?
- XHCI_RESET_ON_RESUME quirk support for dwc3
- PIPE_UTMI_CLK_SEL restore after system resume, there is a similar submission recently [1]
- VBUS override restore after system resume
- The improvement for system resume dues to HW POR or lost of power.

[1]: https://lore.kernel.org/all/20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com/

> 
>  struct dwc3_qcom {
>  	struct device		*dev;
>  	void __iomem		*qscratch_base;
> @@ -86,6 +90,13 @@ struct dwc3_qcom {
>  	struct icc_path		*icc_path_apps;
>  
>  	enum usb_role		current_role;
> +
> +	bool			broken_suspend;
> +	bool			ignore_pipe_clk;
> +};
> +
> +static const struct dwc3_qcom_priv_data sa8255p_dwc3_qcom_priv_data = {
> +	.broken_suspend		= true,
>  };

Why you consider it is "broken", or is it a normal resume recovery due to lost of status
for controller and PHY? Why other SoCs don't need it?

>  static int dwc3_qcom_prepare(struct device *dev)
>  {
>  	struct dwc3 *dwc = dev_get_drvdata(dev);
> +	struct dwc3_qcom *qcom = to_dwc3_qcom(dwc);
> +
> +	/*
> +	 * The controller loses power across system suspend, so the system
> +	 * resume callback must always run to reset and reprogram it. Don't
> +	 * let the PM core leave a runtime-suspended device as-is.
> +	 */
> +	if (qcom->broken_suspend)
> +		return 0;

Why we need this? I see dwc3 core do dwc3_core_init_for_resume at device mode
during the resume.

>  
>  	return dwc3_pm_prepare(dwc);
>  }

-- 

Thanks,
Peter Chen
