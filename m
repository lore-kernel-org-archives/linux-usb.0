Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586103;
	b=ezFnC05MFx2Gch06vYK9bxjiUu0FDd8BfdUGVSMQk4JjS52gcdduKsnLAFGnzPzF9pAj
	 70+CFZncvS5RYh7laaHD2sbq9Q9YZdzQMkxbQ2lQ8qwg78c78u/n/1h4SragaCrf/NOlP
	 HGgrTaQOZ571l2heVyLsH4aISRrELoV+L0Oyr9CuSWy4wnEugmBaMzzz5RzolB0WlsTO1
	 +BGw8Q7q0+O160llI70KfpRpzUkcLalHLE12Pxm/H+hrupDQfhLBgSbqli+HYDh0VlZFO
	 f2HSKJ3P/75WMfosvPwCiVvkthwbjCDqz171dEIL7tJ9/DItfFJhmsiTrb4I1SZc8pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586103;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=y+rsuhJqtWNNFanhIkLAf7k45qEZkJKqZ1V0TJOALXQ=;
	b=Mm6ZoVBi1BF0MGEPi4QM6jUFGHduiCxMgJlw1nbt0e0L3I0ckMadrefWxXyh83w0cyDe
	 /9iJaQOJYjR1Josq2wUJwOWPYQokSU/6cLf8N+S/ScNyYk9JrmaUYvhjNcoHtW/5F5q+s
	 IxFsYXeI1elJAragvXokrljzmdCWxKEc3oxaWHLWsVP/Wp3VnGdvh3itkNFiRwMoe8Tuo
	 I0iNA/gDgZpGKX5ypOuCeUnYPLPKqyqUJUfrWHCsyyt4mEFR+zGqx6Y3Gt+xf1xn6b+Gz
	 V0Mlor/CGuWtUYUoHoFnlLFpLN6Ch08m8HrhINweb8Gb+70ePHEAtnLlAvtCDHQLiwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMPrW8RW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LbdN4Nyy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279A4606A326
	for <linux-usb@vger.kernel.org>; Mon,  2 Nov 2026 02:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 279A4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FMPrW8RW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LbdN4Nyy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A20K3pd1321299
	for <linux-usb@vger.kernel.org>; Mon, 2 Nov 2026 02:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y+rsuhJqtWNNFanhIkLAf7k4
	5qEZkJKqZ1V0TJOALXQ=; b=FMPrW8RWELU0HFKXBk2353xfIqmZ/ZI9edbKVvRO
	MrteUR5KPMlKBgAnVWj1gGyXgFubJDfsoNkaXFV69AxHRAnCpsWeJzEmBun9s0gw
	mULiMBBCZ1D4j0zdtHzHP6I7iubBWGBsZheJm7h73zIqShXQykbOH1w0D2rBs0Yp
	wPbCWP6k+b06/6pOahUllCVSXhdNoL+D6eph+J31xp9E04tiZMt7am0SbiCJDmJG
	DQv3z5wb0a6gWecv7q6CkRVajLgzRUUUWqsSDSVE9/08nqerzF9WcEDytItGXW+O
	PfSbfA9J74TZADvM7zAjbrw53Ezuw+F7BeiNr9Yl+sflnw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m9cktm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 02 Nov 2026 02:21:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6064060eec.1
        for <linux-usb@vger.kernel.org>; Sun, 01 Nov 2026 18:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793586102; x=1794190902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+rsuhJqtWNNFanhIkLAf7k45qEZkJKqZ1V0TJOALXQ=;
        b=LbdN4NyyNe4XrcBBK9+ljE38H3cPlXk76WZAYX64i/X06PNIRZgwip9A9LkRajVATU
         Qo2DOZ3EDKdCYJu4UpQhRcinvNj6qMR3Gs4YdeJmH5cDQYrkoSuC+TGbvhqT9o03qyn5
         KeJeKKtQ4aOP4wjLUiD4bJeNgBrrNy2s85DfRXKV3biZlqDnWSKzSLAg47IqJx21ma8g
         oFjoNQY5exaOxX1EnzMe66q/HP5/I23Jt7+bnv/YTlVV9VsgQEu8C5v9dT5+0t9Typr4
         +rvfHcdE2uk8k0zFsAFFYL0aHTVkUmJ9l3F2l0JL2h1PJnJZGErfqCCl1jenPtPEEbRM
         yo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586102; x=1794190902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+rsuhJqtWNNFanhIkLAf7k45qEZkJKqZ1V0TJOALXQ=;
        b=lu6ljfWx4ZezJAkZBBmV9fjji52R96Btg0mjHk+Yk00edW91X8hLwgXoa/JPcVPRLl
         9NhC4nZY5i7V0JwpoEEeOXxguAqwcLuSTiI+FUUes58kKTWvr9bte5HPAeo6tYZf7dyw
         pbfJQH7Fw475fwQMETdtxMaa78qhctAaDZU6YHDRl5cYBw74pPEdjImofOwa0wDUqIgx
         /Lp1ze9Lo8Ifj/W02r47l3laboMh2oQRfz7FiqBr/OrXN1uezyV69XNESqETx9CMhd7g
         3JY/QvXtEMNS0Jz3eiJKooLjadM6bwZkxI7EP/Eb/TM4xuNgHxjFoIp6SfAku3z5YRNr
         LnDg==
X-Gm-Message-State: AFq9FYKs7Ku+4Mn9nmlVmL6gKNM2STm/o009T85Z7j/JBUDwl42bFJuA
	f5rbsFWmEuERq9SmKC1P2i3soDi9oh33GOPQdYZbLPZMkDuqu6OuSeAdtPVg03YyaGf8YzhlmCv
	SsJBC80uvIhUoETPjvk/UgewvghEAVcYIubfa8fhrNNCJtTrXuYDDMVIDq2YzrZ0=
X-Gm-Gg: AYBFou0nDmKuesw0pPBRyvhSnoC8+sGGDia2X1OsS73CNEoXpRPFsf7gt0tsG+2Yf9l
	7Je03E7PrsnioFCgEIQWRrTeoFWARO08pazYUCBe+s7rCrJpIrRAtqIMKxuzbBJkB82OkWw5f9b
	1Dpy6279PGKbxKFhQUEMqrlwg30enB+diI5rHP2NbUJdc0nflQn1DqC6DU1jUtFPFPFUKCfvjSU
	Y2G0Lo0lQA78c6pPeWcnwTInuofgJuzW5W1+cUojAnJVSqTRsihec2vhNVMvJCUg6UAmfXikI/i
	JKYZLU0yOJFNjLUrG/1sCN4ITRJA10/A0NlU/GXWaQvlZuefj2lPUvggrpiF5uWbpIlVnNdR7SO
	Ro6OmP7waFOfgFt1Ce0cSBYsREY/Q6WoaArJuawJK6hgf1zkXCe04Kejs0sXrdmIJTOJ4jAYRXe
	7BwqAjlAlypHDlL9JEcP0/
X-Received: by 2002:a05:693c:87cd:20b0:36a:32de:a239 with SMTP id 5a478bee46e88-36a420643f1mr13530069eec.0.1793586101455;
        Sun, 01 Nov 2026 18:21:41 -0800 (PST)
X-Received: by 2002:a05:693c:87cd:20b0:36a:32de:a239 with SMTP id 5a478bee46e88-36a420643f1mr13530038eec.0.1793586100838;
        Sun, 01 Nov 2026 18:21:40 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42aa8999sm35620903eec.29.2026.11.01.18.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:21:40 -0800 (PST)
Date: Sun, 1 Nov 2026 18:21:38 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/7] usb: dwc3: qcom: Keep wakeup IRQ enable/disable
 balanced on failed resume
Message-ID: <aufzsuS-hX5HTgLQ@hu-petche-lv.qualcomm.com>
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <a7e3c1e094be9cb4a282925a6c09e11bf746234f.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <auRiR2synrBgWFhI@hu-petche-lv.qualcomm.com>
 <c261c442-6623-4087-bc3d-c90afabad9d2@oss.qualcomm.com>
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
In-Reply-To: <c261c442-6623-4087-bc3d-c90afabad9d2@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7AlBdsisKby6lGeW-Ov9K-6qNnXed_2l
X-Proofpoint-GUID: 7AlBdsisKby6lGeW-Ov9K-6qNnXed_2l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAwOSBTYWx0ZWRfXxZg7Q/iM+G1U
 yc6fNP94pTdLbzs4RrbhqeY7l0aSO7hgA8v+BCrJEXZMCcxozKWY59OhJU4qqVgNvdRuqUkYavV
 o0mY7jy0f55JFq8ujGpWXNRjXegSifv7GxCcaLlqTh3vPsi9542RxYIez4e8WetQD/jXi6YyoWs
 ofmZjz6ypKNmp7CbWdFOMZYsoumexwOx1RKuRMFS1Vq23whNPkXYXeE2qiTb1C2VTxlymj/xzCr
 doM4v2EtBxqz6K2DxJM5StYgzlafXC93xlB29pfVZrjqmk6PoJ7ZTEHGmK6uduoK24pKf2vaAIE
 uJj0mTyh8ffHqB5hRguwBGKxWt6o8gP5Dn16BMwfpOik/pfc7TMStwwW7MEg9r+hV+G9GeG41xZ
 Gzv3mIkmX01kjR7dRcuLSkoFIu+xUpWR4ACcxZ73VjiODCi6q8/202G0vgwfxy3xfkNMkiZDoE7
 7z7FIBCp2TCV7TUdgcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAwOSBTYWx0ZWRfX6pKyYQMmse6s
 46IB8NgnPG0eHxd78ug0a3xKm28cMkdo3EmIFW9fwMIZ3CkzfJDxg4gZa3lyewLqYNQlKFAhHmY
 ExXxYXAfY6ivnjEnyTbapdYs6uiNk7A=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae7f3b6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6HtGa1ZIcL902LZL58sA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020009

On 26-10-30 16:54:55, Faisal Hassan wrote:
> On 30-10-2026 02:54 pm, Peter Chen wrote:
> > On 26-10-29 00:29:31, Faisal Hassan wrote:
> > > dwc3_qcom_resume() disables the wakeup interrupts before enabling the
> > > clocks. If clk_bulk_prepare_enable() fails, it returns with them
> > > disabled.
> > 
> > What's the relationship between clk_bulk_prepare_enable() fails and this patch?
> > 
> Hi Peter,
> 
> The wakeup interrupts were disarmed before the clock enable. If that
> failed, is_suspended stayed set, the next suspend returned early, and
> the next resume disarmed them again. disable_irq_nosync() and
> disable_irq_wake() nest, so each failed resume left the disable depth
> one level deeper. This is the rarer case, so I will reword the commit
> message to lead with the runtime suspend case below.
> 

Okay, so here you may need another patch for error handling improvement.

> > >   }
> > >   static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
> > > @@ -377,8 +388,13 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
> > >   	if (!qcom->is_suspended)
> > >   		return 0;
> > > -	if (dwc3_qcom_is_host(qcom) && wakeup)
> > > -		dwc3_qcom_disable_interrupts(qcom);
> > > +	/*
> > > +	 * Wakeup interrupts may have been armed by an earlier runtime suspend
> > > +	 * even if wakeup is now disabled,
> > 
> > How wakeup interrupt is triggered even the wake interrupt is disabled? Is the
> > hardware default value makes it enabled? If it is, we need to disable all
> > wakeup interrupt at probe, otherwise, there are un-expected wakeup interrupts.
> > 
> > Peter
> > 
> 
> They are not. They are requested with IRQF_NO_AUTOEN, so they stay
> disabled until the first suspend and nothing needs disabling at probe.
> The issue is that runtime suspend always calls
> dwc3_qcom_suspend(qcom, true), which arms them in host mode regardless
> of device_may_wakeup(). The old resume only disarmed them when wakeup
> was enabled, so a system resume with device wakeup disabled left them
> armed.

Get it.

At your second patch, it already knows the context between runtime
and system suspend, you could disable wakeup enable if the device_may_wakeup
return false, that could avoid introducing more judgements, and have this
patch after your 2nd patch.

> The comment read as if the interrupts trigger while disabled,
> so I will reword it as:
> 
>     /*
>      * Runtime suspend arms the wakeup interrupts regardless of the
>      * device wakeup setting, so always disarm them here. On failure
>      * they stay disarmed, as a level-triggered wakeup line could
>      * otherwise keep firing while the controller can't be resumed.
>      */
> 
> I will update the subject and commit message for v5 to cover this case.

-- 

Thanks,
Peter Chen
