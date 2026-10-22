Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639627;
	b=F+1vStWT55nqdK6KromuSlyv96/ocwqgc5boDv3uh1dz1piavjw2WEAyfuatZR5yNazT
	 y0biZilzbYaZpJ0yRqJK3eHnz5HJw+RXgfYkxtMlrCAf0xeDCV14goPsb0sqngs39mLSt
	 rK6frBwzyTFiyyGbZ5pSnbppeP+hsivoKJNa594Suy75kseqsfmD+fyc84nNq+AGnhffM
	 r8TzViuv7t6vFiV0N+KeBUdFPlvfjfWMl6TY1lhEMxqtK1X5ZU6swveoNMrw9YAoTKfrU
	 0SfEkY5YipwQs+CUUABVpNbiaW+tiu+bFKSSzdVhc95BxWgjvsJvBkMJJlb28mf4Fxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639627;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GGmZmli6XEiqC9WcTdozsjPuYlwvOxi9MxEGhwdmAzI=;
	b=lPHcFEc/6YqtZXVlhXZo1mGSRpwutiapXTuQuy3PiubDdfNUSxVW1v870e8dM/kM20P/
	 oIhX97nqBPVdtvyZtAOX0zkxSw4M7VQnCd471HcYBGwnVuWp2A9Ed+hH3OFY+hxQfr0Ck
	 630pCROrGKNU/ZNlHEu0GH14WfK8di/YawQDrDFMUoTVpfph+LrTKsjFToBo5cii6XUsm
	 tufsd6r5Yq6gW2Hycsp4f0lTfiBbjL7Y7Nm08IwSLDq6TAru++rPFjxEkNwp5hX3DTFqu
	 kW+zG195/BL3D665Hob9e57zQ0MC8V2yUg7bMFr2SP/0OM34W/q3/j/Gsv42bl5YUnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=phO3eKgp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pii21JKO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C7F606A319
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 03:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C7F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=phO3eKgp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pii21JKO
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M2eue72463681
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 03:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GGmZmli6XEiqC9WcTdozsjPu
	YlwvOxi9MxEGhwdmAzI=; b=phO3eKgpY/wp9HeFoWPJLOFWRlM1OzwTbpzxGa2u
	lNdCkKoH1oLccrWYbrruuN+KYF774iz+2skToZakXZlWL/ctzgyQMGk9U5oF3oJU
	O2GLjwTQPqt+AzSw9XzdCFt2HswSRw4IBawDZsbP8428R6JF9umjqsdJkCfnOvXr
	KH0ajGUv8//6uFi4kFUKRVCjOzIQE0wlEgdQy79898jtm0jYo2B/qwU8uNHVJm6Y
	LSLKB+Ql6HEsgqTZ70Junp+ueEogCKCeZ4bjTwQsTik89CjlzmroNHMIooqG0ZCC
	Z6UGMMk4/TOeaFviVlwV1B/pAcHZSULKPspIq1pcCf9Hpg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ardud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2026 03:27:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so3316101eec.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 20:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792639624; x=1793244424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GGmZmli6XEiqC9WcTdozsjPuYlwvOxi9MxEGhwdmAzI=;
        b=Pii21JKOA+7a1HFfCqBwn8A9fxtGhIyIYBlnAkjSixur7eOmG1Boe2Dx6n+x2etO51
         gw9wHCkXHa8w0YQlZtjbBUn1M+grXwIj/sEhKWmPBylGWb8wsaCXGx5wt5MtpAcnhQWb
         X6meJnMrJH93+VKhZuHSK4+DOFNths3jMrdVIy43sT2bIdCJCL90QpyiLFmXiWxX7WYU
         vQ2IhOD7bVyK1lCG4+wqpVXK6dMeuMHWpDDfxdY3K59HwjGCXtO7SfCIPOeFqs6SlhsF
         msmIrprEE0h1APBvl5ljs+0SL0ngEuuV+96XDBQMbIbpMHc81Ac+k0kki+iU9wKcwGn2
         TSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792639624; x=1793244424;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GGmZmli6XEiqC9WcTdozsjPuYlwvOxi9MxEGhwdmAzI=;
        b=bynsSTTUKYS5U41TZxpiGT0WgyX/6JKh4QCvgTaVAykWvYog10Ca2TDeKzR1WuO5yT
         ZAtFACBNGasdQgo0uf8ek974SmNMKuumtp3wGN1dO9mc8LxBa7kDCKrLIKZ0020X63+y
         9YlFc9l4kiIftV5YFP+oD6IgeZNpniP0PvLC8rJOySlHpvXSBu9UvWrOtRklfEJ0iBR2
         21+hmjw5e5kM0VyYuhW6l/Gfrv4EPYL6MvhMlc69T8BsgUs7guAW6OdD9Geoxfc/IWaV
         PIoTYmEJorFxroA1v7ZemP/FfQBfvRa7ZulN97v1eVt7hKi4F6+YuFOYrG22QWIMEwrx
         Iw6w==
X-Forwarded-Encrypted: i=1; AKwUvBwKXaYmMv8E7VH8nxYA8KjHv/P0dlE1OlX5CAM29obmbcOLGcQT84GHjixGkM84oYX8fT5cT4UsbsM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIru9XEGWeBcH0ZlcVJ9/GelDlagCmQ/1+xGfvaStzdxn/T7Xwc
	o530Vkb4m4BPas0Gt/g1TgBDj1W9jBB2KkZRhTiOCNSFoGhRE+hng6YaE3H0jk10bgnn5Nr1hpU
	ohb9I8Utv+NiqBrMejjpK9ks/jFNit8frFq5s+OsLFLd7X+eWK1/ogtgVNczvXcg=
X-Gm-Gg: AYBFou0S0ejjP5iGsCrOSGnnGGxgz3/O2greJr6WnfWqN4ksN/CaLjmornXyf7Oo1lu
	wCvdXaL80fnGCpBEXP5jYengU2VobAO8IZzA08fQWG3k63B7LvFzkEd91K/uAvZDkj2Nfx+3pHh
	Yb7rxjyk4s9dedFt07Q38vQOyi0h3QxNJ7oTPZJ566yXnyLnGXhj8fWenvLEVR46g6c/IXniqrv
	SuhIocqXqGCdKEg2+T2GI0eDpazrtoMphAIl+bYFdwOrHC1gIkgqf0LqSNrpoybcvdHpx2TB/wf
	kddyx7WFbMA3jqq2OoZ464ufea/jO/hOaTTwNxmi2ir9rVmMmDsvdVEHE7nTcirhLpwDz4Yz8WF
	PwtXigPxyFw5Xdcfq6qI7VjQBEAygeyJhFDt0+ohp/q2ZfcUo
X-Received: by 2002:a05:693c:8803:10b0:368:8ab7:2a4c with SMTP id 5a478bee46e88-3688ab72b28mr1840506eec.30.1792639624373;
        Wed, 21 Oct 2026 20:27:04 -0700 (PDT)
X-Received: by 2002:a05:693c:8803:10b0:368:8ab7:2a4c with SMTP id 5a478bee46e88-3688ab72b28mr1840490eec.30.1792639623830;
        Wed, 21 Oct 2026 20:27:03 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm17373764eec.24.2026.10.21.20.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 20:27:03 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:27:00 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: fabricioakio@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a
 host with wakeup
Message-ID: <atmChJYMtjPtW_ZE@hu-petche-lv.qualcomm.com>
References: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
 <7eb8f0f7-9e5b-44e9-971c-54bfdab23c30@oss.qualcomm.com>
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
In-Reply-To: <7eb8f0f7-9e5b-44e9-971c-54bfdab23c30@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxMyBTYWx0ZWRfX56NrwdGELWaG
 UFaS9UDZV4m6t301szAbu+Oq5iuYsHLTXhv1I/mma/LCK2Eo9U88GANHEOegYX/Mii8rHHWSUwf
 y50m+q0JaFK2v0Ag+odncYth1mTN4rS14jc45BhDfoSizFjmhiDpuLiGQcPqZnay7uJYG1PR0Sw
 n2wzpXOrLwWB0ov3yJu5ApX6RtbMpkabmO3oUNpI0yyiGbzSNYAL+Z24kQvCkfhHRwT+kdGsddq
 E8FEPD6dPDGgrv/IuZW+wRyMfz9fjl7zLM4exMz8LyeYRqHTVX/TQPtqyUIg2DFPSrTueQZKNWs
 j8WspP9nf4ZdVRpPMDlJxQNF0M45C1Flbc1AX0Q4W6Fqq6JoXzyeToOdi/LEcFY4rcXQv+93qvr
 17dptVXyRX7WR1NFeiUL2ZIjU0Gbt7S6sPJipEEsS+wBuB5Dheva8dIXCIGtCCU9K2VIb3pzULl
 vLNGVdCc32iZnOYqxJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxMyBTYWx0ZWRfX8sEyEF9IuQua
 0TsJL6eFaYS5PB6GTwLGfZecm2T8Q83VYIuUCVJAzMD2JE+eBQ9mgQoSMsGSXuFPkMrlxVojprd
 qG7rjR5EB/cIMPDlxw4TesaKNzSzUHc=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad98289 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=QFNGBFAix9GFkXGs:21 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=uQVJHn5EHz_PyVhorDgA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: _LSellHeD3d35LjGV2PxuxjGSSRVzmYG
X-Proofpoint-ORIG-GUID: _LSellHeD3d35LjGV2PxuxjGSSRVzmYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220013

On 26-10-21 15:44:52, Konrad Dybcio wrote:
> On 9/28/26 8:16 PM, Fabricio Akio via B4 Relay wrote:
> > From: Fabricio Akio <fabricioakio@gmail.com>
> > 
> > In peripheral mode the core disconnects and powers the PHY off before
> > the glue suspends, so the link never enters L2 and every system
> > suspend logs "HS-PHY not in L2". Check only for a host with wakeup,
> > the one case that parks the PHY in L2.
> > 
> > Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> > ---
> 
> I think we should be able to retain the link in L2 in device
> mode too upon suspend, but that needs more plumbing on the
> clock/gdsc side? (+Cc)
> 

From what I see, dwc3 core just keeps gadget (device mode) disconnecting
when dwc3 core enters suspend. The reason is probably dwc3 core wakeup signal
(through .dwc3_gadget_wakeup or dwc3_gadget_func_wakeup) is send by software.
When the system has suspended, no software has run, so can't trigger wakeup.

For runtime suspend, current dwc3 core doesn't consider link suspend event
(eg, L2/U3) as low power event, and doesn't put dwc3 core entering runtime
suspend, so the link is always L2 or U3.

Thinh/Wesley, if I understand wrong, please correct me.

-- 

Thanks,
Peter Chen
