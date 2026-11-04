Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793766988;
	b=hrrQPnbQ6e+90stSx1okrcTFsqRpXHDDjhKggsmHZdIkkQvGsaLdVRKOPioOY75uIBp5
	 cULR/7vAMVkASg0SEJm+zYaTgk/DelUP0723ekQz1ZxIGSSTFBnwmUi28mjCrC4SAXULi
	 uXAh+wIt3exTnkXr2LbLdfdcYey20juK739UVHYxFHen73pKYMTx322D+d3B5mrVhsRBH
	 V3WFggkS/Y2BEdL9r77Ixve7A2HH4XUox5OEgf6w1KKPxtl6y29w9fCWuqG65UAosa6g4
	 rL7dcbiSorage34WJfCjWcqSQOR6Y6Xo+SfNTtZKkdI1ku7qaPTunFU6r+H7pQjk/bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793766988;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3V525maxqjKyk+mej84Kbl6ipEaD1iBYV1Ed7VOLqW0=;
	b=y5taBUPUUUIEta8RG5U6JaGDlhoYH3bWATvYAmKbQjhk+6oZh82PeL0FVUKbGgoP+Zyd
	 dt2YcDnXscO3AnUfu1vc7fLuEJkWRNWfk04o7/cruGtDuPq3/u1YF9xf77JRuOlGNovvg
	 hWMRIEJol+Ut4DWvwuFlaUTUGdzb8e1OObrxtUMiElY8gsBWXcVjUqGzV6PUiTsA2HESi
	 PkMoiOf6rbsdGxEUnmo/lqaeWOGyoPsjI87Oglja/QWA1rQ6dWXLLRBGdPKIR8alpXPiv
	 GmHe7QGYNGgGUFSywPXkRddY74UAE1ozx/Dsz70FquH/KPI24NrE1ZSMQO0f4jY8uFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B+hyv+tS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="bO64/qTI";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4313606A328
	for <linux-usb@vger.kernel.org>; Wed,  4 Nov 2026 04:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4313606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B+hyv+tS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bO64/qTI
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RQNb230698
	for <linux-usb@vger.kernel.org>; Wed, 4 Nov 2026 04:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3V525maxqjKyk+mej84Kbl6ipEaD1iBYV1Ed7VOLqW0=; b=B+hyv+tSKzu5fBJH
	nbGxvLN3dJthWKoHaGlykDB7Uyfe9vZO20IyqlvVtnqkdYtB5BiGt4BcyEojeWUm
	aS2cRx/J+NvrnN2+MM0bUZxT/4S3GGfNVUxsb58lMpAyZT5pqX0by1DWg4BQj03A
	hgavavI3r6yb84zB6k3sEYoZgBHkKsWXS0i0CIwSoXtAPkFqVMyuMiZLtDHIktSq
	IleQiii+G1lI2K4dryFYtCFC0q0OFJVZY2i16nZvu0xR9jSWal4OOWvxPBnyhI5b
	ngwW/b1fGgk0sVlAnBrjA3CyUUtXygx9sXs4P8FVeAn981MXacrg3gF+G7U0B6J1
	0Q1lBA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypk4fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 04 Nov 2026 04:36:21 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso767761c88.0
        for <linux-usb@vger.kernel.org>; Tue, 03 Nov 2026 20:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793766981; x=1794371781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3V525maxqjKyk+mej84Kbl6ipEaD1iBYV1Ed7VOLqW0=;
        b=bO64/qTIbsQgskpBDCf3ZCrAfqXP5czjZG/Hu1zvhAI3lflW4Qq5vvnhRpVM3k8KCz
         sr+5V/9Fl6FhjbcBeaPlGIpC7pcPTXKkUo3eYIg0+QCdEHDWtcQ0pZZxCss6bAmKkvyT
         2ErclEvsx/jcQ/Tz4ivA75JzeSRy5Csf6ockuOUDlslZ1DGBRr8arRbND6rBZ+jOo8iv
         rHamREBWRXRiMkB/x6N50EShys4CTnUSl6yjxNFOXEPbhUJjOsiONAxtQbrX8somj4eB
         OpcZM+FN4DINRX8dbiIjVZsPhf0e5BXr3xxQwdkF7pGN/GujpCwB0568jdh3MhhGu7gG
         h74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793766981; x=1794371781;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3V525maxqjKyk+mej84Kbl6ipEaD1iBYV1Ed7VOLqW0=;
        b=dRvw+gZ2d13wjV20qPczfdgLZUMEpU0sNYAOMlXPvxbAplZ8Le/SL7dhrNpFbEX+wC
         sGALadtluMgEIX9aTMspQWhSk02lbYiGHk+przUNL1uS1dDVDvPAAG8ITK6K+tygTNEx
         b0kW4MdZO5HI+fYrfLKraT3fMCPE2rNElx2plx0DlXEvSzhjNeJliWA2/10x4KoXD21k
         gDZDogj16A+bEvwJcKvC02zlH5Dkhv7Y/F5Sb2jxaXGi8w9yYSHJrK76fEIh01Deoqgt
         q299YQ/q5N4HLiYSJGyB2SW3hSVI5AnGTlUUtJG+3fwh3v0EMDZNsbVBuXwNMAsTTAFK
         mvXQ==
X-Forwarded-Encrypted: i=1; AKwUvByDAwgbaYfamLxHmU0Hc4Ck37oNY3YMMJufzW/SOOX0lzIP/dVjlGcPEtgW3QjsBNzAMDX5Pjibty0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y5CuqPTMyLZMubhfwBXItaXmHe6QykiCucb4MeekhrIHhOHlr
	amHL/s/ynQQCLJRRhOMDIWJ18BR9nSE+nJ6FIoO7ICAbK9yZuxIIFIse1qpq4DhZk0j4pBzXDBo
	6aBd8SaF2+KNdpqj/AOuwnQlxtPYmuIEmJGNZ6B0p8EHVIqFtCLMYC924e1dQ6fQ=
X-Gm-Gg: AYBFou1DTnSHMInYKF0gIO0iTxUFFR09+IaK3+GyPUn8VlbB47oX7J/m04dn7h0Y6eg
	a7qBRGUqCNQlVljXC5D54poAGqFVpgyKFBWd0bkwuNND9z2B03OrDCelLaCYT4O0ZHaJ4BfpURN
	XsI7rw2vB6E3b2MVnAadJAQzoedtBkIya3C459YP01CekMbafbWeyB372LtUgxtcqSJnrMllsdL
	wKQ2l6frH7Mz9klRjHuDn6a+G8WYiUipkFTEKCWnsA9qGgenWiK3nqDya4SrIZL88njuYRnC36u
	Ym7kHXEnNo8iPjoA6B950W28uBXH5no1HcqEAYm4O6X0nVPcnc9oZYeln0SuBDbjhKY0yMFHcvG
	Zi+4HAU4umkEkju5RkA2P7f0Qdxqxj1Lcu5pz9/LAm/PnngDU93x5a2HTQV0OpPnFPHthnELIaO
	E5EQ==
X-Received: by 2002:a05:7022:ef12:b0:14d:ef19:246f with SMTP id a92af1059eb24-1ac5f36d5cbmr24440354c88.45.1793766980596;
        Tue, 03 Nov 2026 20:36:20 -0800 (PST)
X-Received: by 2002:a05:7022:ef12:b0:14d:ef19:246f with SMTP id a92af1059eb24-1ac5f36d5cbmr24440311c88.45.1793766979896;
        Tue, 03 Nov 2026 20:36:19 -0800 (PST)
Received: from [10.217.219.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm4618852c88.18.2026.11.03.20.36.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 20:36:19 -0800 (PST)
Message-ID: <f9d27fd8-cf33-4e6a-a9fc-6770a933cfb3@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:06:15 +0530
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
Subject: Re: [PATCH v2] usb: dwc3: qcom: Defer VBUS override update during
 system suspend
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Vladyslav Tymoshchuk <tvlad744@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261022224220.480-1-tvlad744@gmail.com> <auqXyUxc9cRIuYou@vbox>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <auqXyUxc9cRIuYou@vbox>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxOCBTYWx0ZWRfX6AxsNQGwHc8n
 QYvvlIk8FwB/ad4d4JACGe1f1gxWKQPFTUgEMH+kN6Dj6gGQEKbk1ph8NGJN634E++iz79JRXjo
 3yh6ZWYlD0Rm/LMg2DIhmDybczpbCQU=
X-Proofpoint-ORIG-GUID: VTXnnzngw7uyJnIa1dK3LIxXBGlnce87
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxOCBTYWx0ZWRfX/08tfjxgxVO0
 CzSoYD3bZ29JC/mdHTsljzoGf5f3vl3GbyccruPsH+5kwoFjhIt/FAbpst6nxUCo33+cIbWqpqY
 2SrQb76vKOaJwC4aVEp/F8R50eBDTCSYFC5ff4zDxiFsN9adVcpjBiuMZ0MIExbOZj7UdSOkgEZ
 TXYWPVn2+T4O5wxa0V9YdNhCsLCFpLLSHRWu3PBDZU7vf0hoE7L/iSmf5/Czef5gj9InrvHHnFI
 Rilm8TraM99kZcOgT8gkgBwHBKSUFEKyAtk/42vNLvbass3l/MllV/3tNoo01/P+cjHeLLPduRU
 IU6uQMle0SWEBHoBwOw6m8PK/OlcVP453+pDU+SaX50A/kQULNnA1ee6lrGt0F4YU5kXiU/WNda
 xJI54beEI9tkwN+2oxbOEN0q2mdscbvyZYWhfbWEZAH6yyqaut2nxDvuScgedbDGcTElvpgxNGm
 to527bzZZ6kV8iZMtqg==
X-Proofpoint-GUID: VTXnnzngw7uyJnIa1dK3LIxXBGlnce87
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aeab645 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=DWlGITjgz4oUXde0rNwA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040018



On 11/4/2026 8:07 AM, Thinh Nguyen wrote:
> On Fri, Oct 23, 2026, Vladyslav Tymoshchuk wrote:
>> dwc3_qcom_set_role_notifier() updates the VBUS override in QSCRATCH
>> synchronously, from the context of the usb_role_switch_set_role()
>> caller. The glue assumes that role switches only happen from a
>> freezable workqueue, but that holds for the dwc3 core's mode switch,
>> not for this notifier: the UCSI connector work, for one, runs on the
>> non-freezable system workqueue.
>>
> 
> ....
> 
> Good catch. However, this should be fixed in the dwc3 core. The
> pre_set_role notifier can be called from the freezable __dwc3_set_mode()
> work instead of from the role switch caller. Then glue drivers won't be
> notified while suspended. This is simpler and applies to all glue
> drivers.

I think the problem with that is, dwc3_set_mode doesn't know USB_ROLE
(especially NONE mode).
It only knows the mode which is gadget/host/otg. Thats why vendor hooks
are used in drd.c instead. Perhaps we can cache USB_ROLE into dwc3
struct and use it later on __dwc3_set_mode.

Regards,
Prashanth K

