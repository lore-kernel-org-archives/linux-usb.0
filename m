Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571868;
	b=TCVrzSbjibGz9fkjdQlFDCEhskUawQgYH5OanTS1J8u2ER/OvMzomvk9rLoUkp+RdHkW
	 JybELCtlMXaakMml2AVa/ehcQxnMkGcK4Doe5+GaEak6NMO6LZk3G9N5NumQi/aDtjA7e
	 dAaSHqSBbD/XAbuF/hYZgWTmlWM9sjGKlko40tDZLKlMFffyV6rJLBD0EYU4fEvLYdeS2
	 GDZsAvYhXwqAnw6zTX4NumAC/iQC98U4x7osiXAGc7uWUPJES4ugyOt2hZLz0w1rw0Yr4
	 R5Eawgthwib35eiOD1/Idw9rOkTBE4O390xW3H5TMWe585fQHgqGN3YBB/vuTaDGAYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=;
	b=cRUFUIoMY6F/SMrDVEV1jU63uB3z13l3NcOYujLRtUsW8ryp92H6lKrwwYYoqtSDjXrm
	 PSISdcxydQ+iuuM1NpgRchNegYEmae9YcBLEp6OnyPUGTP1Gkl89IhCZEe0/9dDx6MzNv
	 ai/1o9MIXRjBFAsgTHRM2WFavR+/bqO9z0/YLHVjrBFZnt2/144f/g5VkdVNK3P8Hom9b
	 V5WHxJyqjh0wwUMFdGXljbaUk2Fq5z2BI0SZt4m77b0s3XpIhp7/YVjf4mkfitu6ONGMd
	 vJCpW9oSd44L1ELg7tIlzbSh+MAQrmxqN5kHveugqgWgn0EauojSICUqfH6pjd/D3WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TEFiQ7Cg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gmBZxwg/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70779606A336
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 12:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70779606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TEFiQ7Cg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmBZxwg/
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADC0Z514173902
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 12:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=; b=TEFiQ7CgOeSRnQW/
	Se5AoZ7dU6cjjcaKCcUCdHvC6glfYOpUgtIi46FqA8lPXUVJgojFjfTr5Twfu4Mp
	CQbbN6g6pHf3PwdXgHahKEHyyYCJvFy3uK1ZrPlHyfhXCDZPXP7l2zI3/X6YRhr9
	P4cuWfILX/CScAZSIlXC+90djbPnxUYlMfurTNDWM2n9N5nRSr3Zm+vlX3pnFWhZ
	As8+Ov7kfmMtzFJB0joQo73uFu88E+LeiTT/JhxBaznhr2QHYE+waIvCpoMzvaU1
	mUm3VHg+zCXtMTkhyvJzq0nOEheAZ9Jegsrr/fM1r+Ndg83P6CJP2LKdzamirrDX
	+ZsSTg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja9970-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 12:11:07 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ecbb3b4696so50955e0c.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2026 04:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794571862; x=1795176662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=;
        b=gmBZxwg/XbqtrqP2oY5LPz0tR+Xlsf3EK8DvNSJ1rLx9AofPyhzm2VQVvXVe4JZBqx
         OxgSJOVwbJ0o5JaQMKSlltQMxvdvq4J/n21qNljvslQMWk621bEdPn8ttOu+Lbe3UH7d
         +3xKZVHZ/L43kTKUZJ2vU/LUqd+LJrcYZ+SxgNovrNfnrwkRs3rK4WZG2ml2tSK5p+iq
         iecQvJEjCJPeJ+s9iggi4m4wOyMTontB8DhfUyM5I9auPFyujfzSGzZEMHi2FujjyKVi
         VR5uXP6/MOfEY/p8Twe3ZB/IMLUoBomk0ofKmSVtF3tp5YjlI/roFhNUgEOHp0CHwICf
         Sd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571862; x=1795176662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=;
        b=pIuqewFY+U8wIwt4FYiDcFI+ulHRJEK2PuUjMXEOk3grAjrpPjlKyDPDeWRxiSAB8E
         186mvNQZSfscKAKwWXuawpiLeYg7WAQRNSqcUvoiU7sbvX3vluvin1MZ4qDFrFc185hZ
         iWhPmBo/T14uyFXLyVE50DcgR8xqwwKs4XsbuoWf0vXtTI8J5NIsnFQ/JHYnWeD7kYvJ
         xSmm94N00qDNFDbjZCyUTo9zsIgVTpc2fRdBlYhrLibXHB3lvxOMMHP6h0VWZPXwKkfz
         BY0coOmzzm8czf2aemPgGE7pfGLntCJATeJ9ZAVsa9uqPREuxgND96i+vn1SUJ1g15+Z
         7MxQ==
X-Forwarded-Encrypted: i=1; AL+hErHySlSu1FyFuGf9Bu9GEBZCo4cxi/fBX7mwghRG2XGOfgdlFOiBoci9ZMhZle6im+8KXM3lG/hyioQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z88dDyTKuwF+9C+DgN7GtQo7ov0DZmJfrpK1VBseb8lAOlSOkXj
	lw+5L5Kq1Qn7J/TFBOfV00ZWJXkac3ga/yoKL8xo8EbiThHFPliaSopm1XmNW1akhQ2FRN36lnW
	b+4h2eNfhFVlWYMH6Yf6+XlzOYWpXxh/dgtF9hlOwTMl2GIh0OUsxFu6/uD5HnTI=
X-Gm-Gg: AYBFou2M1T/W19aTAQrbAoPjZM651rjO+E43jZEBHAEB5bDyr6tcg5ool8AYnjokWTu
	q8sREPVkv+ljcJ44xYwAJmNIDz28PtsT8RmMyAmdS0IpUVDYasAGcriSKCxhxf3fuGdSyWdLNQv
	FF8GFj/kbw480bjzluoWE3cAz/IQZ2oKb+4EnXDXzYfeJpFpB1E+czbSGJDad//RU3K2jKyJAw5
	vcsbeKp44MWAGEK66PktnwT1T7pheG/9hTX50GqqM2NCbcT7hV84CFpXI8HAf2ZDS6mr0ElD1Gf
	pg6iHRHI3su/N11523MNz8Z/b76TcJXifTe4Lwh2wvdEDOpCevgqpF+X3dcA1glUz0WDeUyCUFt
	iKLtXxPtzTqRpEghiOIyqPE41eF8yY2TOlPB9nsQv8jIsOI2aJnx2emTg4Mj7q15eFtEpWYI=
X-Received: by 2002:a05:6122:6c09:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ee346b6663mr738712e0c.2.1794571861683;
        Fri, 13 Nov 2026 04:11:01 -0800 (PST)
X-Received: by 2002:a05:6122:6c09:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ee346b6663mr738699e0c.2.1794571861279;
        Fri, 13 Nov 2026 04:11:01 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b56df7sm86814566b.47.2026.11.13.04.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:11:00 -0800 (PST)
Message-ID: <03d75b49-dea4-4736-a662-27ef64682157@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:10:53 +0100
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
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Lee Jones <lee@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
 <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
 <20261109170407.2073295-1-lightofmysoul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109170407.2073295-1-lightofmysoul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: d2CEfmMOj2AXh_Z5wyxcMURlsSeFvkdy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfXzg0fBf7HQblD
 WqSYoEUNvUylPwvILgJpghdly0Q83rgrnEe9N9aPQCZoqGp9sieFttJmzITbjQVRqWgSd7scFIl
 PJzxFGyj0Sy2Ffd2yD8ArE0fDP/7nsc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX/YVM5scLCjbk
 HFsJ6AqQ5xyGG6OUXQAV6G7Bh2mgWAYK1U26k8KEexnCNYqD/bfuUSo5YmPfjNGi0N5sowWWBP+
 xApFcXfN+ni0PjCNEJ2qZxaTmZcOPiEs1XSBiHPvLnDaT9Mch4I20ypa4SrAPQn6qCHx5z3ukrj
 cXtZBMR6iV8JgVYbcfwheo/t/1dLgoZJFtBgT5QsE/2Yt2gMqTEYaOUw2pqUas9WfSpNUw5Mx1s
 A7lRYTQH6byTNmYIYK1MGXJZjF8irL4fU4arB2TaUUtKrtsrPjd65t+6cJlOWvg6l8dyMej9S4/
 o3wxlhHUEDZmWsuBLc/Enlqx4MXs9kxpSxMqjVJYkEaHAQpgnvx6X3Zfpq6JEltjrb05eolggZB
 SLjD035Xuwf9MESZtoilLldo98TUwRIVhNktcftQnCORfWZ9y2Rfp8EwggDAgxL4Jvu4qHUya1k
 vVzHaT/Af1hPXzarIVw==
X-Proofpoint-ORIG-GUID: d2CEfmMOj2AXh_Z5wyxcMURlsSeFvkdy
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af6fe5b cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VS6XN_di3_qKZAQ5k78A:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130048

On 11/9/26 6:04 PM, Stanislav Aleksandrov wrote:
> On 09/11/2026 16:12, Konrad Dybcio wrote:
>> On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
>>> +&usb_1 {
>>> +	dr_mode = "peripheral";
>>> +	maximum-speed = "high-speed";
>>> +	qcom,select-utmi-as-pipe-clk;
>>
>> Is there no superspeed / dp altmode in hardware?
> 
> The headset supports USB SuperSpeed and DisplayPort via its USB Type-C
> port, I just haven't brought them up yet. It seems we need a new driver
> for the Type-C controller.

OK, we can do that incrememntally

Konrad
