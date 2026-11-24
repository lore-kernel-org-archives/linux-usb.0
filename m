Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488434;
	b=2whR1kdSr2PCI4W1nXflcFrQhiCpzpTFxIhlNCNPBM5Ewgzrr1LLDEzXSOAxrMn12Sc5
	 fyDS5wnc74EQDl3YVsY18Fmpn/whDuDCSDqmYuNLqI1vfG/hER1di+CYn+qEzpk8GW8L0
	 6L/Wbf/67QjrFBM2dFwdcu6OWsX/u3z4x/NuXZlSugTdHON2+qCoHMluScrTnuFYEWn9i
	 oUgNk5hGcIWJevbbNU+kDCjnmRnrJl9ytf6Gp7vdEhzqUh89RXcgCB8uckMauiyF1rlGH
	 wDZW6f0WFMLWGQ25o63WKhFodpOjYJdWo78qniyBoAGCsdNMaSPR0ivLAF0VbgQZcoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488434;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9H02wQlFdIPXluo4QYcyx4DfthKEsjHhuAsKhNR0hjA=;
	b=u8VaT2wbzulxkFIxTo1DYQaC7MVrGvqW5sb14hFftxwquC78OW9MWMCV+RSWnyKwQC61
	 yvP3zGy6oF/l5KhBP/4BjpJ/zjECCFwVmT1JxAX+Tu9iM27fxo44Vfx6rynNmfbAggxnv
	 GuHpb7dIU51HmiNQ/JIOQmXn6ph7ngshP4LQaKjs+nOPxg9cDFbnk911TGZBLh5D4S6Lu
	 4jIiv8/sfqkIY1sHSKCKsskOW/yZymN7j0uvcdT1n/pm/lZrNo3hNM7DyoRU2EKA5K00f
	 Y4iMGYQZ7giA4ga9nUwpEyadygHTxDs4XfZxs5FRdz8X/MpN4zA2T0nP+JiBelHqSKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bQZe0YDz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6RMTDn6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CA4606A31E
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 02:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4CA4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bQZe0YDz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6RMTDn6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kIGF3850779
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 02:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9H02wQlFdIPXluo4QYcyx4Df
	thKEsjHhuAsKhNR0hjA=; b=bQZe0YDzTkdonnXeELT7B9bA5TvvL92s3bCTVn7M
	INPDPoc5ractfCsOpm42KbDBPg8nxqVwYIumL6eKqSXXHa5PwMGJCR41TZsM3qH/
	qKqevsUVrqeLA0+3gV+eDwI+1pCN4FtCzJowkA6aBZ0d3D0zr7n7ZKPJD2r2LgCG
	Zr2COTTb67s8McvamY+innqVWzw1pE4dQZZkRO88ekqQG9XA8dmy48vGmXpIyWmF
	ogU1BNiY8ORaoDhWOb5OJ3BNCQr0tDGsQqKwgcmE+4m702gTlYEsUTHEbcEA7R4w
	+Wfd4mfk0g3fjGkPbxaMBdvQCwdSYPQEoI7DCwqRNW+9Rg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvb0edp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 02:47:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a5005fd0f8so1717219c88.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2026 18:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795488431; x=1796093231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9H02wQlFdIPXluo4QYcyx4DfthKEsjHhuAsKhNR0hjA=;
        b=f6RMTDn6Tmfd0ZSrSOSC3+JbNh2ZP17Tlt61KAVN/R+IbW2mN80hX2n9bDG1N5AFol
         Jj0lzZwNe3ekT2u1ne1UBYbb7BkDGV1P7RoO/S3qbCeIoKiq+gN1HLpN9MONJVNYOPiu
         ryi96NEtui9m43xlKG9SlG5y5lZdwLcmRZ9101bqcEkdug1hA/LPJgaNQGR3hhZOnXXE
         Vh2jHw726jA/nOVEYbcAOW3qfeLwAwxBKInGf2XvHm9YYXjkNnx4wH7EUmDJ2chM92ml
         ROPomxEHU+a9GJMIIM+gk6B5XIM//oDBtf/gXQdu3hw7GPtdUscBIaV3eO4bDwBNzAOg
         S1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795488431; x=1796093231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9H02wQlFdIPXluo4QYcyx4DfthKEsjHhuAsKhNR0hjA=;
        b=FFJOHpsSjFQwyX5QgFtHal0mCPcjgDgaWxx5LEVyz1qQx5VoSTO7lcBKcyxyWa+rEX
         0RSkb0SZp9/P4DN4WekJR2WZoLESrl1rK8hBCsrF1e+c1XH6l0UBkuMOZjtzk0xNI4cb
         D8I2Uloin7eiVL8hky3xd9AX1MqcILHWQLm0LM4w5Aa9JTePHGRoKPpA6LUPJXweYzbK
         LZkZlOdwN8di3SDlqXhSSBR2aXAiYB64sywmbMCkTeZiawIfy710eM+APBSMapE1Kgbj
         yIjeRLBrCfr9n6S4kXAQgn+5c5rwRKGBovW3XAbCFAbHJGr/9nPLKBhV1MotBKrcEdXm
         UedA==
X-Forwarded-Encrypted: i=1; AL+hErGLdWECT379YyhVoQSz4O6O8jv7r6g3xwzeDIs2Wm7rhBZy7IvPvwn5WVkeoR9mpb5JeJptmP4Perc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8o/5OJh4EysvEnUOBNS9Zj87iN4AcfEnqGy1sXGL59fPFw0al/
	MqMTkYCsVeblP2itJHmO3Gb9FE3QEP44asLSaeOYujz/Hi+dUt2zGb6BBPiFhmz3af2Km3N4CoU
	dI0ECBidO+rww7+SgT/9HlfJUBXGFSsEXtnUFO0Xn4sDopYU7n6VBJS7cJ0vk564=
X-Gm-Gg: AZFdTZfvaj1oaxUvUADB4QseDmZWFhRAKiTAw/8EXedWWhl+veRPzg2Djyt896FxRAP
	kBrMwNYBbB+V/HILrBjbuszegUe4yRB2gOC9jhj7xlp+DHLtq1B/4FxMhNPCKtrFURm7bt2Shhj
	k4yJ2r3zjMcjybuH3IaxTlGqL8cxLnd3RCm46CSFJNVP+KM30z0/k4ry+pZRDPAy/Cz2QnbUSJU
	/Z/iLU/HvLByW3mQeGCu9HTe43cfiFt9ObIOufbGAs0f9w0M3xZTGBkX2+3XMLdDRtEXf36MNYZ
	7h6ib7tHPhKzp0jadendJbLhA2Tomrg97NJNMaECeI1dM90W4rdbJDAQ5j61MBIGiQsAsup7vsy
	WFeLEcbt6ItDYN8MV9PpgW15l58lNapgfBV5jXPPjddru/j+aHJqDee9OLgMfVhfTyKTMYzemTu
	a3ZWdroLncvrVnDuWDUxtqpFQ=
X-Received: by 2002:a05:7022:2608:b0:1b5:342a:e4f0 with SMTP id a92af1059eb24-1b5568b678fmr18621077c88.6.1795488431330;
        Mon, 23 Nov 2026 18:47:11 -0800 (PST)
X-Received: by 2002:a05:7022:2608:b0:1b5:342a:e4f0 with SMTP id a92af1059eb24-1b5568b678fmr18621015c88.6.1795488430785;
        Mon, 23 Nov 2026 18:47:10 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm35685565c88.13.2026.11.23.18.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:47:10 -0800 (PST)
Date: Mon, 23 Nov 2026 18:47:07 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, heikki.krogerus@linux.intel.com,
        abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        wesley.cheng@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, val@packett.cool,
        balaji.kalkonda@oss.qualcomm.com, tvlad744@gmail.com,
        effeffe99@gmail.com, prashanth.k@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tapas.rana@oss.qualcomm.com,
        vkoul@kernel.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jack.pham@oss.qualcomm.com
Subject: Re: [PATCH v4 0/2] usb: dwc3: qcom: Keep USB 2.0 working in
 DisplayPort-only modes
Message-ID: <awT6qwRVeAuPRBth@hu-petche-lv.qualcomm.com>
References: <20261119124558.1548-1-26rote@gmail.com>
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
In-Reply-To: <20261119124558.1548-1-26rote@gmail.com>
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6b04fab0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=dLxMsxsk7CsyiYUDLEoA:9
 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: cAgiEdsNpLqOuAggpLY_HgGSntfmQImU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMCBTYWx0ZWRfX4AUV7An41P5v
 RNQRqUQIn8oxdcnTdFCTXFUoj+MKOISiRaCbn/A3RMFzoIDp2rOg0w5i/qpDmljagbpeK1v272f
 Z87lElRte8FgGR3NPL0VYfeYct2WCP8=
X-Proofpoint-GUID: cAgiEdsNpLqOuAggpLY_HgGSntfmQImU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMCBTYWx0ZWRfX2Pba3xml8PZU
 ZbHcQUU8gcfiJ3ASAoOq3uDIaqAkW6DgcEbT/g+rk/lcO93wdU0wPeIk0fAjEXRFEMhqX2wnD4+
 Q6qvBxKoR8t3ih2KD+QIyL9azPhD6d5ScPbbIcLX8LrnlywoktUiYyG2/NrSQmQ5plGVucXG24u
 WgVdlG/bBU1jLahjMTJ3/sbSNKSEXrIQLVF5VmRo+ruyR5Djf11JzZCJN2szm44fgNTPXCREgOu
 v9L8nix+m1DZoqUdX7gS5xTKY2YjGzIw7tcjfYRGR5RdJILiY2TvFkBiQWblltfIoa18gP07nDH
 A0TudlT0K5FKKx8LDlen37WBSU36Ir3b7+BRPZqdR6VGdUghMvVpi7zLNVKYLKQaAOoc0PR67Io
 C6UbUA1C62qHS05wg5+3aC6twQ/JBe2lD63d0H/cFKgK/bFcVo6ZEpmz8BhY6lrlOyrsE7bIcvs
 kh8LwSf2qGEKmz37eDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240010

On 26-11-19 21:45:56, Joonhoe Kim wrote:
> With a USB-C monitor in DisplayPort pin assignment C or E, the QMP
> USB3-DP combo PHY gives all four lanes to DisplayPort and keeps its USB
> PCS powered down. The USB 2.0 pair still works, and such monitors often
> have a USB 2.0 hub, but the dwc3 controller still runs from the USB3
> PIPE clock. On Kaanapali the next xHCI reset in this state times out
> ("Host halt failed, -110"). USB stays lost until the cable is replugged.
> Commit f546912bcac6 ("phy: qcom: qmp-combo: Move pipe_clk on/off to
> common") keeps the pipe clock branch enabled. That is not enough here.
> 
> This series registers the dwc3 glue as a Type-C mode switch next to the
> PHY, so that it gets the mode (it does not route any signals). In
> DP-only modes it moves the controller to the UTMI clock, as
> "qcom,select-utmi-as-pipe-clk" does statically, before the PHY switches.
> 
> Peter Chen suggested on v2 that the PHY could notify the controller
> instead [1]. This series uses the existing Type-C mux framework:
> typec_mux_set() calls each mode switch linked from the connector in
> graph order, and the controller (HS port) comes before the PHY (SS
> port), so no new PHY-to-controller interface is needed. The cost is a
> "mode-switch" property on each controller node. If a notification from
> the PHY is preferred, the clock selection in patch 2 can be driven from
> it instead.

Hi Joonhoe,

Thanks for explaining the trade-off in the cover letter, I may
still prefer that the PHY notifies the controller is better, for
the reasons below.

- The controller may not know well what the PHY really did or is going
to do:

   qmp_combo_typec_mux_set() has its own policy. It does not
   reconfigure while DP is powered on, and it skips the switch when
   the PHY is not initialized
   (drivers/phy/qualcomm/phy-qcom-qmp-combo.c):

	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
		dev_dbg(qmp->dev, "typec_mux_set: DP PHY is still in use, delaying switch\n");
		return 0;
	}

	/* The mux still receives Type-C events, even if all PHYs are uninitialized */
	if (!qmp->init_count)
		return 0;

At above cases, no switch clock from PIPE to UMTI is needed.
If qmp-combo calls the controller right before it tears the PHY down
and again after it brings it up with the new mode, the controller does
not add wrong or useless settings. It uses the UTMI clock while the
PHY is being reconfigured, and goes back to the PIPE clock only if the
new mode has USB3.

- Once DT ABI is added, it combines the kernel code with DTS. It needs
to maintain both DT property (graph) and kernel code correctly, eg,
it also depends on the layout at pmic-glink node. If using PHY notifies
controller solution, it adapts for all related SoCs, and no dts
dependencies. 

Thinh, What's your opinion?

Peter

> 
> On Kaanapali the PHY becomes a mode switch with Balaji Kalkonda's
> DisplayPort series [2]. The controller side for that SoC is a DTS patch
> sent separately to the Qualcomm tree [3], and Tapas Rana has sent the
> same for Glymur [4]. Neither should be applied before patch 2: once the
> controller node has "mode-switch", pmic_glink_altmode defers its probe
> until dwc3-qcom registers the mux, which only patch 2 does.
> 
> Patch 2 is on top of Filippo Falezza's "usb: dwc3: qcom: Restore UTMI
> PIPE clock on resume" [5] and reads the selected clock back from
> QSCRATCH, which loses its contents in system suspend on SM7250. [5] is
> still under review; patch 2 will be rebased if it changes.
> 
> Patch 2 adds "depends on TYPEC || TYPEC=n" to USB_DWC3_QCOM, so with the
> arm64 defconfig (TYPEC=m) dwc3-qcom is built as a module.
> pmic_glink_altmode then probes later, and a monitor attached at boot
> depends on Yongxing Mou's "drm/bridge: aux-hpd-bridge: replay last HPD
> status on hpd_enable" [6] to be detected.
> 
> Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with the series
> backported to a v7.3-based tree that also has [2], [3] and [5], with a
> USB-C monitor that has an MST hub (two displays, DisplayPort over four
> lanes) and a USB 2.0 hub. On each of 5 plugs the controller switched to
> the UTMI clock 1-2 ms before the PHY switched, back to the PIPE clock on
> the next USB state, and the monitor's hub enumerated. After each of
> three s2idle cycles with the monitor attached, both displays and the hub
> came back. Plugging the monitor in during s2idle woke the tablet. The
> mode arrived after the glue had resumed and was applied right away,
> before the PHY switched (once with each clock selected beforehand); the
> path that applies a recorded state on resume was not hit. A USB-C hub
> with DisplayPort and USB 3 kept the PIPE clock, and a USB 3 stick on it
> ran at SuperSpeed.
> 
> Changes in v4:
> - Patch 1: add Reviewed-by from Krzysztof
> - Patch 2: mutex_lock()/mutex_unlock() where nothing returns early
>   (Krzysztof)
> - Patch 2: leave the probe code as it was apart from the new argument
>   (Krzysztof)
> - Rebase on next-20261118
> - Link to v3: https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/
> 
> [1] https://lore.kernel.org/all/avZ7-Ax-_VwcJhYG@hu-petche-lv.qualcomm.com/
> [2] https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/
> [3] https://lore.kernel.org/all/20261112113921.1143-1-26rote@gmail.com/
> [4] https://lore.kernel.org/all/20261117113834.925310-1-tapas.rana@oss.qualcomm.com/
> [5] https://lore.kernel.org/all/20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com/
> [6] https://lore.kernel.org/all/20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com/
> 
> Joonhoe Kim (2):
>   dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
>   usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only
>     modes
> 
>  .../bindings/usb/qcom,snps-dwc3.yaml          |   5 +
>  drivers/usb/dwc3/Kconfig                      |   1 +
>  drivers/usb/dwc3/dwc3-qcom.c                  | 150 ++++++++++++++++--
>  3 files changed, 143 insertions(+), 13 deletions(-)
> 
> 
> base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
> prerequisite-patch-id: a793fca7329dac964c21459f8d7a8b003d36d84d
> -- 
> 2.53.0
> 

-- 

Thanks,
Peter Chen
