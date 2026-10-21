Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590298;
	b=lBG44WcqGZErwFsXUM2P5qcOueD+5xJQgAvhHsJHDZXxOFmxw+vRNJR4tybOTtX7E0f2
	 SsLQR9ftFlnl4SQxagPwy2hObC8m2pkpHBbInoJTliBvAtChI5L9L3M7ffpaDB5dhwprb
	 Zn/xctzf5UXQGPG2Em93Pe21qJCtM8IjyPKdBeG5NJCLDRsuNZASE9TOMW22nuA2H2bUF
	 edMXgPcLG2wiFEJp/eSu95RVNBwpjmWIgvm4ThQ6xPkSWBVxHZKLCLiP0MSEOH4V3Aefb
	 djiTmygA639J8sYV7FVhwioWFzR7764bt9Z5WQ6hGFNKFZcRwiBEje0oqtQvNRhpAOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590298;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4HFJLn83kygPNb4chE01mOHDBkV5We/MxsvCuFn6o6U=;
	b=N2B7ZYrwzT62VGlTnN6BfD9c5MsHFKEpCPsIVlKofhUpuPpyp+bN3tBn9LSsOw0R8tcW
	 GInNmKRG8oNG1wkdGw3CE+WYXq00NE2EAT9ToN2xgxm5iNnoTOMDwgHTbRnMEdEtLO2Yf
	 AYOGUeTd1eKcmoEbAfGUh+kRu4HVnksxlEy0k2nOXFDNdV9aKcARmeCDcO9mPaw2Hqp2o
	 lm0ds0G+SMR7VxV7S7pfEPE56fQTadO9OuZ3fIMUaQiYb0NSAC5mbXX3r6xeI7sV55ri+
	 0K1gSnnpOAvBPjLAUoos2JDg88ABPYCRvJ/APHmw/aVDRFc609mmFOhfIqDaVHXO9FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUxQwyQc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hIQPDwi4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0470606A31D
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 13:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0470606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fUxQwyQc;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hIQPDwi4
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBgt9W4168634
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 13:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4HFJLn83kygPNb4chE01mOHDBkV5We/MxsvCuFn6o6U=; b=fUxQwyQcb1/73HkE
	hHGrufBLfRzLHURFpHedf2eLTNvdvRIEdUh26bdpVFAnaRqfFFuVyKAo2adWD80N
	JDkdtOtajuJYoeYPZjpUZtIEONH4emz+p1UZ/dygS2NMJi7GRC8OV8RXeggGUHWj
	9z8H09Sefd/RRvLUJgui1wN8hrP82AnWjrBlzS/HJmGXqoruEqrRTuXvQm6nSM/v
	ChRw0TNb/w49QEWr327yWiXq21MtWkZ3BlNDza/lzCBT724oMZDJesmjjQlBUkl1
	aMZh5rxyFNXqsbhoJJLsGY6JbGrIY91CZJpoI6OdONcKFM5QHDVNlDBkNfuqhIX8
	eXMNcg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0m6r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 13:44:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1440e081so17631285a.0
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2026 06:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792590296; x=1793195096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HFJLn83kygPNb4chE01mOHDBkV5We/MxsvCuFn6o6U=;
        b=hIQPDwi4OS6dLClXV33BIspcr4sidgyFCKs4COUUsc8aCkVg7ep8HxVKna94TNiLOW
         qiC3sHxsSASByLIgmD4BeIHSuePvop87TnZWXZtXaQlbTATfuMGYYyQxyf2MZ3BX5lZs
         lfTw8CduIUQ0DnCcx3rpHG1CeZZuKCtxzByWTfhJKkEgcElM36WvZVjGIm7hTrAYyrdZ
         wWnkbTmOYSCwkBr4wKZtvo7Uwzhzb6CQ2MltjdEJLReDtRgsTuv33crPldVNfthoxg3v
         WiFzZmKd+dKzwCFAzWziPUe8cpjKNl/trVXPiGEjvur87XTPU/qkLt0FkAk4/AmvDdtA
         I8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590296; x=1793195096;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4HFJLn83kygPNb4chE01mOHDBkV5We/MxsvCuFn6o6U=;
        b=AXlguaYAXVd+eGmVtcMizGMBmFY9TBFIbRtTGVXVT3TBcnH7rxw74Bna4WCphECC0x
         ApkKv4sFtP2IX0TwUQNs6ZTMNQbIBcSkPIN8fDWCnEOtq+gJiAyziZRrDc79mZ4UqPkk
         5kQEfU6beKdQwnnuZRqVw4rNYzY6NGoFJkNQGBmpGIZWel/qiLJdqD/YpVsuhEjMhs9j
         zC6mar9qY0OKJF/kt2vMwd8gmKwmmKKJ8yXEX/7Z2WdsWkh6IVICTt9wluPA/LRg2axE
         tAx5cMGYYMZOvE356xgRuattWLTQPlbE7w6rQhNQSR6XQolo/y+o30feQzACX8VNyTQ7
         rO5w==
X-Gm-Message-State: AFq9FYLOLD434OVtcKt0yrnkuEM2brrNiS4VPofApx0ZoY8U/si4b+zF
	pM1JZP4bcxGTXoGu4fSRVvzrmivFSjtexTG+elQFKsqCzY4D1GBBx3ops2Fbdin0sF4ivkc0R1y
	+KnMARtMz32O2zHX2acCQCR+Z/fQIf5bmKFXs1C2C77sESX5Kykz3wD1qez884qQ=
X-Gm-Gg: AYBFou31W/4ssFg7zlix+SZp+EBV8WE7sNxY+SHlqYIUoqjgZOPnTYzyz6YWnzfu+hW
	BNzvH7N4rujLZ5Wg4MfWyGMIvpR4w0Mf+UEO53kGPGdv1n581fLiheOP1k0arbFbZoCZz4s+SNs
	D0qQBEWWI0LSa29no9UgnORAp/K/tSeBKZETc34fw3ebi/KZ70QMDnj+e2OGm2BlIAfXSJe5Ldb
	V4zfAFVCnHM6fE7QDit5bKNZ/IKA0ZlnZD6xW2AVq7ZvoRmiR4CRADo0CK3EnCxl+PhtEzZoyHK
	BrrQxhFGMeYxHdVvLk4z393jFj4juBK7vjF9oPcPNylddLjUzMxUta2jgISzyod+yEbuej6yKyG
	AE+yuu2o=
X-Received: by 2002:a05:620a:2a08:b0:92e:6485:f640 with SMTP id af79cd13be357-93f57fa2115mr496122785a.4.1792590295755;
        Wed, 21 Oct 2026 06:44:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2a08:b0:92e:6485:f640 with SMTP id af79cd13be357-93f57fa2115mr496114885a.4.1792590295090;
        Wed, 21 Oct 2026 06:44:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59d61esm6097366b.56.2026.10.21.06.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:44:54 -0700 (PDT)
Message-ID: <7eb8f0f7-9e5b-44e9-971c-54bfdab23c30@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:44:52 +0200
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Post: <mailto:linux-usb@vger.kernel.org>
List-Help: <mailto:linux-usb+help@vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-usb+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: Check for L2 only when suspending a host
 with wakeup
To: fabricioakio@gmail.com, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-dwc3-qcom-l2-check-v1-1-43c5c6e97922@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfXzrO3ZzO3aXOy
 HvjP6uPwHzkwTwhRM5T6n6FOyj5k3abXUUerCYFkkpgj9ZYUOSaGakBoZn8hX5lV0Dde1qiWql3
 C3buoX3UOGPFBYZQg4d+ybNYf/ZLO0RZznbevOBT6Uo3QIo9HYT7YbnP7OMIfKqJT9MOIr1vWsU
 06szMcik2y1fX0D9VoRLq0IEwQtlUs6127BKzSVV/+HNnQ3KWj3ous4B3XHInYUpcytHXArcCug
 YcmambzOC1iV7ZHonPdXjQtLlWgxaNmCZt8j0UjYAW4WIAO+h/qZczQxqXPivbcXfC5+EZ4glca
 ZR2fxUUxKV0EtUh5MLrIxDpv8yhQnRfB+0u+XvVHNB7gVkvVpYu4QGivy+C2/mSxCFeswKZCBoc
 SLqeKL+izbjbw+dtaiaWl69oQpeEkEl1EXOCSxidpWnJGfgfggufM7LJPBl4j0c6kklMMQ2dN6Y
 Mj+EmT8uxrAd/Usubow==
X-Proofpoint-ORIG-GUID: RYxPVOd8DUxR9SOHV5YnEPyH4zFH4JvL
X-Proofpoint-GUID: RYxPVOd8DUxR9SOHV5YnEPyH4zFH4JvL
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NCBTYWx0ZWRfXwJjb4YtV7WqG
 CAJVJYefOv6PdEhcNdW8TNuwUrcNZjIE7NKCzq7I5AQHP6cLSZeS+8HlHayn5uX5SNrsoWJZhy6
 4zQUaGmfXHq8ksmUqCO7hWrSicDb8SM=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8c1d9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=QFNGBFAix9GFkXGs:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=0a4RfB2vrMYbvN3io2kA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210054

On 9/28/26 8:16 PM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> In peripheral mode the core disconnects and powers the PHY off before
> the glue suspends, so the link never enters L2 and every system
> suspend logs "HS-PHY not in L2". Check only for a host with wakeup,
> the one case that parks the PHY in L2.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---

I think we should be able to retain the link in L2 in device
mode too upon suspend, but that needs more plumbing on the
clock/gdsc side? (+Cc)

Konrad
