Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795582061;
	b=lgG5ygL0qQZzuH9PY3Yka3wElm1hpjL2fo7Q0svSDdJ2G/w761WJYxOLbp0Hm1QrRZo3
	 FUEFVOf3QSxRM6cy2iYi9FUt1WYipD5+t8YMPlv0fjS82m54VfGEKy7ouZqyzWneVQK+o
	 RRFhP7oj2LErd8c7iLgIkKp8KUbtDsRi6rYKsbs89t9CQ93qv2ADV6FefRIG89WNQvmzg
	 hYGA1opgi6bGzuaA8RmU5/bWhbXnrcuaboBkcRiaOlWrMEEmigu467/LJkUCyLd5DBzfG
	 YpX4OEB8XYpKmx9z0sZ1wXLYr3O1aWF2AiAjJFm4sYhTwZxUPJJVxEJ1GrpCgfxn8tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795582061;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rSqkYmyNVoE9XBExO6aBoa6bFdUh2Fv5AJwQ5ckX7wk=;
	b=YajRHMgWE9fAV1/5VND0k3vSCo9mC15vQcHKlmMf0RZTUpv/Ea12GSJkcXSjFagP+xRV
	 op4Pt8p4c+RuOzytHAsVOWGYe3vHAgtUiG+IGHjMjEQHgsbwMlq8iyeLoNBYR7GnNIQDk
	 7E2LCqkKuDgSeRkVMLR03kXJWPhmVI/4Y+cxG4mw8MFLSBwf0MrbjCJny/rGmldmxYKWL
	 5yfx9HPZ6/oLIK/3gFyX9JFQsuJQXK710TxqfGzLypKlUce2gp3zK7QxTsII8J9VyEQLA
	 Clz8UJZACL64UBNkASxkB3GmQStxUfoOKdg7JKodgLipj7cnUFjwiVjICpGJ4R5YXtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iJr5sTRg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jLO4CE+1;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE4D606A321
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 04:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CE4D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iJr5sTRg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jLO4CE+1
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2Asva3974100
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 04:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rSqkYmyNVoE9XBExO6aBoa6b
	FdUh2Fv5AJwQ5ckX7wk=; b=iJr5sTRgejp0Wp5Nug0nKmqOkf4Tw8v5Z72geQdQ
	5wITPkyCcr3O/uBBuM8fWexRNQjSDWcIsOTQpzWywkp5iZfSFSt7ev4sYcMy8flg
	s0fILpEr1F2T3uFRvoDm9ncG+cHddeg2wcbHN61ul97Ff46ldKmmt/WoZo+sB8kC
	cK1QYGA61TQXtdOio4AsZjktTLT6LbGHKDgLOi8NMKWLj6UyKjbEXbXXdyvMvwsg
	tgDQPVf9gIqvTpQ+bCdkUyeTe91tja9CnoqG0qbWpfglRCkFdqCEpI/8Bvmsd/yy
	Tbp1XJpj+n8vqpewzcqhWg0Rnn41KcMeplVfj5E1MOKW7Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rrsfa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2026 04:47:40 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386177b0516so13766195eec.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Nov 2026 20:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795582060; x=1796186860; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rSqkYmyNVoE9XBExO6aBoa6bFdUh2Fv5AJwQ5ckX7wk=;
        b=jLO4CE+1b8W7NZef2lkH0Vopj+qJFDBuzpuFH4tvHWafo5Jh+LHNWt2JzIdW8pp+rI
         EXVc3QlxxGVcr6AtUgraWAMavwG1g0PTDSsoEsIV9M6iucahbuguF1eIsTmEXrXUe2Nq
         Ugp6klwhQC+y0knRpvV2j1V7JsXctr8I7zve1AVUgGp8Hn57+6uIyiWS8F/n51/EjJpC
         4qo3ZZN017clVDXCXzeuXP3JbXZIM2i1hw2Lz82lr1BZZVmG9X/k92kPn3vfzeF6Woh+
         5G7U7ETeUt4h2an2Ni1t45Dr1YZ8u+ARntdaNlqF6krDxUhem8m+6PnFtKUiMuephOhc
         EwLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795582060; x=1796186860;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rSqkYmyNVoE9XBExO6aBoa6bFdUh2Fv5AJwQ5ckX7wk=;
        b=cXskfpy6XhLUfaCVNuV/kEgq0JwFKttUk4/uGY/BXCIYKQAR3V0JDl7FCugX6uexDL
         SL4lKGM8unJmlfTyED/72LGVBoN4VmmKgXMOAGVCP1NFr4X3RrH23izBwOiPtyEjn8S2
         L/c5e1nNPJbRK8LmrDaRCkwOKITgASeFPtky79Waah+j9S4dp5LTeDEGyAIMqFu+KYzF
         UNnAnModC9zngC3PPWwYTYTG+3bd9/0ZYw4oS2aU2ZJ1JbKlKbw7VEYueUzm31jzRdFq
         j1dft/5eM8U44DeqZNqUdWPW3ReYfJ3oxGkMOM9FGnsNqo2FyFSxanj8Eri28AGg3sw+
         +L5Q==
X-Forwarded-Encrypted: i=1; AL+hErG4xmyR6PwqEvIGybtuiqc0jAgKiDPYAsrp27E6178JzkUN6BFJFeLxCFQap9dEudr9cEjjONFRYj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+c8fA15dXzCibk+ajQwqWzK9//V9AuGK4PvWJ5fr0pu6gZdxCQ
	B9ZPsK0Wf+hbCzF0z1W2ccr3EIgycuLVbvfgM92uGBcY1ZN24SSYCU8hNrZjxtcfXuEoeC3KC9Y
	ToLhgBiV9obMscM4dBiMqSR0j9OmY+FX4SKG1lHuNGJKIQYb3MTbHM+AOT1/VK8k=
X-Gm-Gg: AZFdTZfIuPz5MT7cIVHHBXGVYBT5tiuHxvAmdh8TuRouq58gP8c3sf3GNzyXGLCn9gN
	jvBApghdjgFRt5qyqWn3yYqEWQaTVKJoIUDFrlbTQ+0DziirbJA1rsDASW4aOBwme/EaCi577go
	LR77p3kA2iBXn6uUwaoK46DR16c2cfAFf9WwdqdomOV+c3NJr9kALIP66ERllP1hmLb00Xum6se
	HXv8L8Z9Tm8Zgh2PvT5Q48PWV9Dy+cHfBfdHvWwY32hLAS9tJniJXYl9IgzmXhsyC7Z7zb0Ua2E
	Saq4yG+/8MJ3XsoaXBQLwowZ2DzgU6LohpZff3CKNLeR9S8Bl2UyTvvpDM2TbJYJGZCt8FMim1p
	T04HpEHsmdQLcgKSyyg5FqS2BywO2M3qyGs8oY4J6mJ8KvnLClOBYS1AIMtM9yHXTGhvV2sx2k5
	UeExAjmHYJgKgH51U1hqxTmi4=
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr17165642eec.32.1795582059708;
        Tue, 24 Nov 2026 20:47:39 -0800 (PST)
X-Received: by 2002:a05:7301:f02:b0:384:ce59:5e21 with SMTP id 5a478bee46e88-3856f6503d8mr17165624eec.32.1795582059154;
        Tue, 24 Nov 2026 20:47:39 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm61563180eec.5.2026.11.24.20.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:47:38 -0800 (PST)
Date: Tue, 24 Nov 2026 20:47:36 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        "cros-qcom-dts-watchers@chromium.org" <cros-qcom-dts-watchers@chromium.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/1] usb: dwc3: qcom: Keep wakeup option default off
Message-ID: <awZoaJ6Wlfuxvuit@hu-petche-lv.qualcomm.com>
References: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
 <avUMs981FKk7Kr3a@vbox>
 <avV0Y5dLG0HOD1ny@hu-petche-lv.qualcomm.com>
 <awT8VH-ZccQXmw-G@vbox>
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
In-Reply-To: <awT8VH-ZccQXmw-G@vbox>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxOCBTYWx0ZWRfX+Fh4A8J6BAtb
 6KRi21jsp4hqfd0phUqdTp1ye1/S+bbRsJc5MtfSbQttq82rYNsumg8LhHzE6UPjSGCAaN67VZU
 hiK++cxohQ7j9zuPR/yk9Acg04Ylf5ylZZmcC/FOGilS5rx4MUdDaX3HU5teSBkMp12MiFLETlQ
 yWpbB+O3slaIf+ht5V2iVy2u9GknElbJ6w2fDmSUnsGC94x9ZEM8V+RHknulX3Y9issQRtCCkR9
 bvpbmojw6atlFiKAKsrcVSa4jU/OOpuXv7efL5T9XgnJ8g97ID0x38YXH/wLlTuI8+xQjFfAJSL
 Gas5EoTfzpLAwYZX8h/8WQo7kw5U2U9tRmrz+3DLr2yZ4MOtZcGfevPj6G1MG6Dj79cXnd6plaf
 mifau/bcDJHPAZVezu7VRqWACCr5aLD+csznEoIPQGbXMlKWqVPPutIg6LEe54MtCcUElD1h8tp
 /thLvtShHPotyC3ULtQ==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06686c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=2-JXCys9dqvgC_yrz_4A:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: DSndmZbZLQM9HAetvo8Vg0o6OZOHBAn8
X-Proofpoint-ORIG-GUID: DSndmZbZLQM9HAetvo8Vg0o6OZOHBAn8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxOCBTYWx0ZWRfX9W2ZNahiEsYr
 1P8SeC0PbTI1ZuYXakuRXM/JN2pJlp+TUVsxwSdkBxDZt2RopxE1YxtZVhqn+Xyfan0cZC9gQ9z
 xs3u4M8UPQCkVJvGq8xyf4f3HoMqeko=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250018

On 26-11-24 03:11:17, Thinh Nguyen wrote:
> (Sorry for the delay in replying. Got held up with internal tasks.)
> 
> On Thu, Nov 12, 2026, Peter Chen wrote:
> > When talking about whole system wakeup chain for USB:
> > dwc3 -> xhci-plat -> roothub -> downstream device
> > it usually depends on user program (per user option), but not bind to
> > kernel driver, considering some situations that USB device are disconnected
> > and re-connected, its wakeup option may need to re-set, and one typical
> > solution is enable wakeup options before system suspend.
> 
> I see. Looks like dwc->sys_wakeup is already false since
> device_init_wakeup() is called after dwc3_core_probe(). Can we fix that
> separately so xhci follows power/wakeup at suspend?
> 

Sure, but first, we need to align what behaviours we want:
1. Who decides dwc3 core has wakeup capabilities?
dwc3 core or glue layer driver?
2. How to decide dwc3 core has wakeup capabilities?
Has wakeup capabilities by default (xhci/cadence/chipidea) or depends on
DT/ACPI firmware setting like "wakeup-source" property?
3. Default on or off for wakeup option (value for power/wakeup)
4. xhci-plat has wakeup capabilities by default, we only need to
set its wakeup option as default on if dwc3 core does the same thing
for question 3.

> > 
> > Yes, it affects all Qcom platforms, that's why I sent RFC patch for it
> > last week, most probably it have "regression" since it may never
> > be tested under the situation the PHY is powered down at suspend and
> > power on at resume, but that kinds of "regression" is the bug we need
> > to fix, right?
> 
> Yes, but USB wakeup would also stop working on existing platforms by
> default. Do we have acks from the qcom maintainers on this policy?

Bjorn, would you please share your opinion for it?

> 
> > 
> > I have tested at Glymur CRD, external ports work (USB3/USB2), but
> > the port with USB2 Footprint IC (USB2) hard-wired does not work
> > sometimes, maybe the initial sequence between power-on and suspend/resume
> > are different, it needs to debug more.
> 
> Which other platforms can you test? I'm fine with the change if it's
> tested enough across platforms, or if the affected platforms have a way
> to keep the current default.
> 

There are 10+ SoCs enable USB wakeup default on for Qcom, I think it is
hard for without function regression we keep PHY off during the suspend,
although it also should be fixed. Let's see Bjorn's opinion?

-- 

Thanks,
Peter Chen
