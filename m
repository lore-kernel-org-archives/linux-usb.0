Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794538494;
	b=QU2aOXFxJGCPDhzOGujKUzZ6og82IsSKVFN7qDJv2MkeuYfT3gbTYwQwAtAJCnfRXyHU
	 FsWG3qz/ToqAUBHpTsuyehAzEkkU9f7diQ830Yt+2pHQzEms3AC5P3Mac0Kiu3y86wtgD
	 7x+yw46Dw3/yxE4HiFV4mOfieTC2wkD/t4q6uzuGiKHPDOiSqGfaKGgfCjtpWd1UIptRm
	 qB1hodT8YVr+aqzR/lUZxQJgiyAFgbaRAYKV1EcYlNwTGgUQV//8x/Y5RGt8jujUsu98b
	 sCvtOZTrwT8eNhKJ/RBWcWJ/Jso/jlDM/Fp6aDoMN6ejxEBpRmL1ERW4Lu6fugZXwkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794538494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3IFlEUS0jw9JEezJjoa+Ahcnwnp+ipK5GvAoLO2eIuc=;
	b=vhv/vwlZYxCKCtxfOcC1fjN5m1fLYPKge7QUjxWyv2r5nVwlqXKLPP2sftQ579jBR+oC
	 4mL7PRo8Nw4CXFqvHd0CjoeHdWXQ7lOFliLAiuhW6nNPsDVga16Dnc3QdiAtUGCA1Nx5l
	 B+eBu+fjvsKBps25HYpXLlhWHVpZkFW7G2V4SOADQQqrV2GVpGbLsD5reptJmiV3KOgTo
	 dJkY8WHBgZGo+6fsmqMnEhdK/6KCddNbkH1c+2xTHtORn83u7BMh5ibe51I8NRazZnM7x
	 i6b+Qa6SAdkt+X3N8XBLA47AGjn8bbVOD3WtJ0fp7uiRAg9hAKKVb0jaNv1Dsvr66gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mAeMaPNT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guDtYZxZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893CC606A327
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:54:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 893CC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mAeMaPNT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=guDtYZxZ
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2K5rF2843296
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3IFlEUS0jw9JEezJjoa+Ahcn
	wnp+ipK5GvAoLO2eIuc=; b=mAeMaPNTVcH/RfulSEEcf4Mi0l/zKk1TLAWJAtut
	+wC78LhpJPRTAQlt58ob7fzUWFONgyOCpXNUrTn56jZOeh3Gjrop6WZyyV7/G/R9
	mLEkkduNNJE+IeiZ/afjYjkQbM4X+BmS8fyBY21rQ/+UlFW1Pz6PhUIgU9sBXOOU
	X/A/pHJKgyDyzySC5gfzIRAJ15Uys/qUtmWxpYBc0XGQkukWFTHdKozsi4WvyQg4
	aRGnso0JKeArYZA8K+cd2h5kd4j+hOti4g94W6curiWoahmahS75i7hgKVPLRl4A
	+kuxpU3VuVTTxDbcclph6ghL5FH+SgYLxX2I1zFEvZucHQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwan4ubte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 02:54:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3724667bc16so276158eec.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Nov 2026 18:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794538491; x=1795143291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3IFlEUS0jw9JEezJjoa+Ahcnwnp+ipK5GvAoLO2eIuc=;
        b=guDtYZxZ64ptWGyTeSX0Z2mpOWhSvzMJ3uJMNmDuodMfYOkarOtXwZTYAQjKbLO+k1
         BXQJToSfmNJ1djhw2MwzqQkBKgcOjyLp2noskNzk/WeIvogTQHs8Wz4vFWcy2HiA956K
         +abZcaNwp6qckPxxDqx4XqrZLYjJHMLW3vlFtGHVoy8Kld3kfcjTzuud4/mBwBUc5y9R
         a89RmFDsMY4OUi3QE7NyA3UOUhp2VI0XSgKJuiKh1mux69MwIC26P7pDadG5W+ULDF9Y
         x4c+zqorS1sCeMcfx5C53RRWj7t9BxBPm/zkHG+mcRmp5vlnpA1MYjHAGM39wB6niNWm
         u/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794538491; x=1795143291;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3IFlEUS0jw9JEezJjoa+Ahcnwnp+ipK5GvAoLO2eIuc=;
        b=b3CxymXtAssxKzj765s1Gb1IqD8NbLUT24PwvevVlzp+as7BrzlOo+Q3dMWCSBOS0p
         GJbIrF+mLkK6iBpX7CUX+UOn5ex0eZ13N3bihcf46Y/ezPfhsfgFooT/cyN+YTAVClES
         0J9ZX72RgbXA15H9r7mLH4QGCj4psC/3PTNBpaPONwyKjJEJr5gtcrcdtvbFG/30BN8w
         iOqHsRzV+/FtkZoikdpy7xwBTyvSJSAB6B9vmr2H2l9r9/ALSlYtIr9AvxsLJVERHced
         mlLkz/AKUCV7wI6i9wEVqVkuP+agcz+Ik7IugLSxRS22KteNwax/d6DoV+qh5ny69zTW
         f8Gw==
X-Forwarded-Encrypted: i=1; AL+hErHeufJmH8fQ9umtSk9dsDb+pU/lQ4DJbxen1HC+GSzJkOt0MZrWcqE0AN+s56TSbCqttRfurIZMCIM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AMdqeD87fLDL6mw7TkoyCfC1X/4RbOl/iaIJoiOqzDPQJKcOw
	uwUaVu7Qy3/u0l8Ay91/taRFJOsgcgNK2aqn2wZQgIMsIhN6oAmPdBd47aFS8uozmKAOZ8ZwrtZ
	hi8suIiQmBSFi9S/z+8YD3beuLj4/mOKdUBKJ117PkqYAqaGO1SGmKXUNFuXgqqY=
X-Gm-Gg: AYBFou3eX+5K34Ft9A4D0WpL9uKPSDX3SOV0n/5xHI1JiUuIgbHToBRJzDZAMmrZXNw
	GTPTU7HXVmOXXCYir1aBXcq/uM8ww6xV9ReHBJWHPqi/ZxJO8Duo+LDrLe6mfVLGsbKi+sHfQfh
	m307ys+oETKE87QTowbjJUt5A4uzS2h7AhY/l1SfEFcH4gwnm/SAIyPRMV0RoLjc5JGPC1G3ewd
	u4rVotJENjchAkg6GthCPqXbDOe80tQVc8aGKrT7/Oj27b4qzKpQ/a4+V6CHYCcJQfA8g3A0Rl3
	D4arCkJAWId7qIx8GE14VqdCKEvhi0JqKj9mY+hI0ujiHXIXFy0AoPcwyL/jzu2RJF7m2nj9HzE
	2Gjj6vhCfHSAjU6jAjGDSlT8iRjmR61p/EuynQWMcitjjAw3XDQKq6+BcgSwPycJDhlI5NrXlPP
	5MHqjOpgM6tl8Rsv8KDc7fRg==
X-Received: by 2002:a05:693c:87d4:10b0:371:197b:5ade with SMTP id 5a478bee46e88-377e1016802mr3939802eec.11.1794538491158;
        Thu, 12 Nov 2026 18:54:51 -0800 (PST)
X-Received: by 2002:a05:693c:87d4:10b0:371:197b:5ade with SMTP id 5a478bee46e88-377e1016802mr3939768eec.11.1794538490435;
        Thu, 12 Nov 2026 18:54:50 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm3910027eec.25.2026.11.12.18.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 18:54:50 -0800 (PST)
Date: Thu, 12 Nov 2026 18:54:48 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abel.vesa@oss.qualcomm.com,
        wesley.cheng@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, val@packett.cool,
        balaji.kalkonda@oss.qualcomm.com, tvlad744@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] usb: dwc3: qcom: Keep USB 2.0 working in
 DisplayPort-only modes
Message-ID: <avZ7-Ax-_VwcJhYG@hu-petche-lv.qualcomm.com>
References: <20261103135057.1682-1-26rote@gmail.com>
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
In-Reply-To: <20261103135057.1682-1-26rote@gmail.com>
X-Proofpoint-GUID: QA_gGgMdv1R9gP50nm0FnsThVknM8Hsa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxMSBTYWx0ZWRfX93Ka9b9WVS8P
 umRWzKW6w/4YwiP1yVvuQI6XqvYcUFCw7GZpUhtYLCT5nqG6P4/EDoXCQ6zcMXm0NW+W4cIeKcC
 4BvglLI0iozVqi8IYKW9i60gFLFrcLU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxMSBTYWx0ZWRfX5SF6rh1XBcUo
 UyR8OKriUIKcIS9IF1fVtC4p0f+PZkyQ1+LvsxzOYLD/60P2O4BtqC+mhfyFw66zd2zYGfq8ppD
 odg7wN0i0sAU4MrwEHtemXE8U9KHa2qR9B1hmk6jc/KscReUYAQrVnfq4Ht2s4LZyPlwqMr+5BP
 INHfKfCC3P4/j+S+WTEK4dbFGCnY1QPXjN5MuU0VTi2Tr7aBxGkkbE6/gqKFsoO4ztfBd4IPCc6
 BgkhaY3ZnwJ1kILoZ1OCRq5yFu/zHddrIxR5pJnw4cG2tlsp4cyt9CTR8kOVXUWT8gyFr2H8BRz
 1kEgtSpU9bRiQPK/Qg5QAqjwsCCEZv+2dxfoAzeSkIwqGgpNB8KmCaVTVmQXMjyc04IMnnX4gGS
 MMRPbpp4CNMgO/lD0XGva9zBVEjbBIuofNqMrmvAKpSHpbKkRhyA5SHdiytep5Ju2TTS/aqFaeV
 tGAjn5B1rzJP9qyglpw==
X-Proofpoint-ORIG-GUID: QA_gGgMdv1R9gP50nm0FnsThVknM8Hsa
X-Authority-Analysis: v=2.4 cv=Gd+CDgXL c=1 sm=1 tr=0 ts=6af67bfc cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=76iuuaO-dfIhFSRFSN0A:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130011

On 26-11-03 22:50:54, Joonhoe Kim wrote:
> With a USB-C monitor in DisplayPort pin assignment C or E, the QMP
> USB3-DP combo PHY gives all four lanes to DisplayPort and keeps its USB
> PCS powered down. The USB 2.0 pair still works. Such monitors often
> have a USB 2.0 hub. But the dwc3 controller still depends on the USB3
> PIPE clock. On Kaanapali the next xHCI reset in this state times out
> ("Host halt failed, -110"). USB stays lost until the cable is replugged.
> Commit f546912bcac6 ("phy: qcom: qmp-combo: Move pipe_clk on/off to
> common") keeps the pipe clock branch enabled. That is not enough here.
> 
> This series lets the controller be a Type-C mode switch next to the PHY
> and moves it to the UTMI clock, the way "qcom,select-utmi-as-pipe-clk"
> does statically, before the PHY switches to DP-only mode.

Joonhoe, thanks for adding this generic features for Qcom platforms, it
is not only for Kaanapali, but also for platforms which have USB/DP combo
PHY.

We did an internal discussion for this use case, we may prefer the solution
that let the PHY notify the controller this PHY lane is going to change from
USB to DP (4lane) event, it could keep driver independent with dts for this
feature.

We more prefer an general solution like [1], but it seems PHY maintainer Vinod
prefers private interface between controller and PHY [2].

[1]: https://lore.kernel.org/all/20260924-b4-rockchip-dwc3-rockchip-glue-v16-1-126a2e9133c3@collabora.com/
[2]: https://lore.kernel.org/all/avZvYlYyL3Doc8qt@hu-petche-lv.qualcomm.com/

Peter

> 
> On Kaanapali the PHY becomes a mode switch with Balaji Kalkonda's
> DisplayPort series [1]; patch 3 is the controller side for the same
> SoC. Other SoCs whose PHY is already a mode switch (e.g. SM8650,
> SM8750) may need the same property on their controller node (not
> tested).
> 
> Related fixes sent separately: "phy: qcom: qmp-combo: Leave the USB PCS
> alone in DP-only mode" (suspend in DP-only mode) [2] and "usb: typec:
> mux: fsa4480: Keep the USB 2.0 switch on in DP-only modes" (boards with
> an FSA4480 on the USB 2.0 pair) [3].
> 
> Patch 2 conflicts with Vladyslav Tymoshchuk's "usb: dwc3: qcom: Defer
> VBUS override update during system suspend" [4] in
> dwc3_qcom_pm_suspend() and dwc3_qcom_pm_resume(). Both add a lock
> there. Like [4], the mux callback defers the QSCRATCH write while the
> glue is suspended for system sleep. On top of [4] the two locks can
> become one.
> 
> Patches 1-2 are for the USB tree. Patch 3 must not be applied before
> patch 2: with "mode-switch" on the controller and no mux registered by
> dwc3-qcom, pmic_glink_altmode defers its probe indefinitely.
> 
> Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with the series
> backported to v7.3, plus [2] and [3]. A USB-C monitor ran over 4-lane
> HBR3. Its USB 2.0 hub worked after 10 replugs and after a plug-in during
> s2idle. In the s2idle case the mux state came after resume, so the
> deferred clock switch was not exercised. With the monitor
> unplugged, a USB 3 stick enumerated at SuperSpeed. Quick replugs (under
> a second) worked 9 times out of 10. The other time no PD contract was
> made, so no alternate mode was entered.
> 
> Changes in v2:
> - Patch 1: use the common usb-switch schema
> - Patch 2: switch back to the PIPE clock in the mux callback, when a
>   USB state follows the safe state. v1 waited for the next role change,
>   which can come before the mux state (Sashiko)
> - Patch 2: keep the UTMI clock on a change of pin assignment while
>   DisplayPort is active, as the PHY keeps its mode then
> - Patch 2: while the glue is suspended for system sleep, only record
>   the mux state and select the clock on resume
> - Patch 2: depend on TYPEC || TYPEC=n. Skip the mux without
>   CONFIG_TYPEC. The arm64 defconfig has USB_DWC3_QCOM=y and TYPEC=m,
>   which failed to link (Sashiko). It now builds the glue as a module
> - Patch 2: no change to the role notifier
> - Patch 3: note the dependency on [1] for the PHY's "mode-switch"
> - Patch 3: add Reviewed-by from Abel
> - Link to v1: https://lore.kernel.org/all/20261102215121.738-1-26rote@gmail.com/
> 
> [1] https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/
> [2] https://lore.kernel.org/all/20261023123512.1912-1-26rote@gmail.com/
> [3] https://lore.kernel.org/all/20261022165143.1327-1-26rote@gmail.com/
> [4] https://lore.kernel.org/all/20261018143126.3978-1-tvlad744@gmail.com/
> 
> Joonhoe Kim (3):
>   dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
>   usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only
>     modes
>   arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode
>     switch
> 
>  .../bindings/usb/qcom,snps-dwc3.yaml          |   3 +
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi       |   1 +
>  drivers/usb/dwc3/Kconfig                      |   1 +
>  drivers/usb/dwc3/dwc3-qcom.c                  | 103 +++++++++++++++---
>  4 files changed, 95 insertions(+), 13 deletions(-)
> 
> 
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> -- 
> 2.43.0
> 
> 

-- 

Thanks,
Peter Chen
