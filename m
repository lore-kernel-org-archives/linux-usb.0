Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2D74CA79E
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785939; cv=none; b=WijhMUDgAPmOgt03Gdq1nSrgw+8guYOgGnsLxDp5pOcj7h8e2kaQ7VGohwcz1UGAn8hQWPFk3AnN1R6ROREaJrUUCLgpx7KzxR3eJL+8JP7a1iBNEs7qhBLMEaIUnt3ukDxv78vkK/5d0bc7LBjV5BPUPbfg265K7hMsgZd5IsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785939; c=relaxed/simple;
	bh=DCoJBl7amgy1yhvT0dMKEv17zLSUXval2AKvsyCluU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d6p9+Z/C5ln7LljkmwWbklKAEFovbtYkuIxhk76K9EWcE8y91hIv4paoUFqyTLpb/gw7lBAEST95Wb9YLKA58xXogOb1Vj2KpMBHqkNF5k9Qo2SthxTr1sLLgoCaWrudAV60GHJmTj8felFWMNFoQo0hMQr9yh5JzqLBKf2B4xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGcf6o2U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjDeGOfC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGcf6o2U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjDeGOfC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnRXA4064577
	for <linux-usb@vger.kernel.org>; Mon, 7 Sep 2026 12:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=; b=EGcf6o2UIIuEKCYK
	CaYp0Nq/4gplEhtVAlwhmQ5EslBXQU9NyFdO2u5HRtgmsRf0TS0UXDhNBEX9Kdmr
	S+6mBh5GAcKOymJvbErVkAnZUucs63xmwQ7h2wkVNaacjCSpyhoi6hpMldlUEoYY
	EGJ+oHo8kkRJ2MXAfNeZhw9mqtKRCmeRJxP0qB6yUn6K3zA5vmvAoeIDUrjSdvb+
	37qKC6ZNxjV/Iz7VfXe3LEbUD5qVQAwpRXXvqij8MFfsSVXQ36wCQLIZ/LAWf06Q
	3rwB3W+lTBHjlFSrQTMTi1bJu8X7/WvtNpbMciORo6r5JYKX0KH1zyunCm5/qEkq
	+4gnIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86s97n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 12:58:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9310484c005so44722085a.3
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 05:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788785930; x=1789390730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=;
        b=RjDeGOfCCgF3C977Vx2lOqzuvynwrkS96jRHKmKHIoDlDmOZ7nHEqGTp1ok5ryCPZg
         5zalpzhGz5OXtB1dA4KzICi/kGLMzUqVDf/E/bjSptrHgG9xwqvX6A3F/THkkABfG8Ae
         G6gL+QjO0MXwcsFUVg19H5VpdcPH0Mu6XU7SJIzUyH6VBOsFf5dwmrNGcvqToeo0AYC1
         xy4MpoZTe7ezskhg0gNzTp9xrhL0ztATBm++R4gcbQA9K/9LWGmJuAUWwfwxbkc4biEr
         qa6qyLIY5LFqwWJ890p1D7YjzJOfopIESF419P4avtj+tDb774A02sA7RaVDgEUzzWme
         7fXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785930; x=1789390730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hTV3Jv99sfe9cW5IJgrS0LaCj6vwLsGRAv//BgPKHf8=;
        b=Ond23GyClm2oEd+ZZHPVNJmAnyDDAE5PAIFNWol9JbCqyXysyAfHLTJMpJesnpM2LG
         gYhCV9d4K5UWcSn4/QDwEQGR+q8RSDemu2HWo+oRsv25/a52Iqa4oIivUTOkn1dTz/Bp
         /qEIWm3nPSkONqafx3IKdnGYZGxKj5khBlnt15rbA66qnnIBZl4TpbfVlrBR07TinhKQ
         VjBO8qRChH+fGtaoqZx31DaHUElBsVIG7nIa4JOm7WOq4Vk+5R/dkwWPPQvcx5WCxbbj
         B+dNHEbr6xCftJxIR5glE5BuGJ3SIUlNZk5IKIshtfRWrB55AWqdrRzPOCTAB0dOI6qS
         /1Aw==
X-Forwarded-Encrypted: i=1; AKwUvBxGrsU5feJj2rFj8PpQL+VsGAhZWfdYx4BUOWhvrx0qbmdRIHpUjFB/zoEoJbDl3jcN2Lq8NS2ZonQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nVmLeWT/ZgC5p1ROuZtE9C4uW3Nzt8XoZ0aB9yjeMnGg83PMqd
	cnhl27/lSn/xIDeq5c2A5shE6M/DX9Jwj95FamPyGrwbaWpvUQRYOACw6I2fux65kH0Oz7YbIZq
	xgXprtLLkJVaBveFHnBGdTd6ekw8yM+SYYtiSOXF/gBc9RAt3sgoSnxnKx+kMEQI=
X-Gm-Gg: AYBFou2KWIqO50y8ozF+okn8d9OMZz3ilDuu7Zrd3//EhxP9PpdmZhLmFQWVV+X9BNN
	lXO103zSd58Emk69r7673QG7EpXTn9TfxOcHTcihkcJwbeHGtP/WmZu3BS3Z2ksdMWXEP4WBF+Z
	mm44+T0xvrWS1iMoRyPZB+/VB3BfLOFruPWQwh0EsTrEO1gz79CI3F+F86urZE05NZMUFCw7K2j
	DFy2iDSkqyftnI/oF8oarHB5JNfHSElFeei/o3NDHytBZpdZ8RaJ8rl7VXjKyWoe/ASiksIA8q0
	sZdCTcH0rnJRrDeGaloZ24rY68cAH5kMZRYuye4sfsEPFN2xXUy88jlEk524Wb/H676Ftd81Qh+
	2monZNaN5FJcBAMyb+vhrdg==
X-Received: by 2002:a05:620a:4623:b0:931:23a:83ca with SMTP id af79cd13be357-93980be17f4mr1857109985a.4.1788785929761;
        Mon, 07 Sep 2026 05:58:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:931:23a:83ca with SMTP id af79cd13be357-93980be17f4mr1857106385a.4.1788785929336;
        Mon, 07 Sep 2026 05:58:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68e9889sm4250685a12.22.2026.09.07.05.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:58:48 -0700 (PDT)
Message-ID: <0d79b582-75f0-4577-b4f4-a028f83442b4@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:58:46 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] arm64: dts: qcom: ipq6018: Flatten usb
 controller nodes
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-7-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-7-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 0sp9X7mKeJKeCualLAMhMvkBWd7bKO3g
X-Proofpoint-ORIG-GUID: 0sp9X7mKeJKeCualLAMhMvkBWd7bKO3g
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX7qFr394nYemX
 GQNE3DtIDVXM79QC0WSxYQtigr0pwy7vLFnFTs4Y0WXu+QoT8pqc9sT1TvdNyxCnWrPTGpXsd66
 0t0wLsueW0ve0wfY6U+8lverqWkJdfo=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9eb50a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX30ODwKFHFkth
 akFtQTunfpG64E3r1fEdO9glbxTh+KT6trX9BfsMmr7HMBWEBuq1jVzdhEagGnT0088J9FyW9FC
 gkjAR1jk9+I9A9hKzUyuiNeCmjBSC4HiEkNOAKgOIoEmL4OGTzCgnk5PzbEWINtSlZj2uWRX7W0
 RZXxDZdPl4F3FO0BtUlff5/sDadZhiPG0Ac6HzpoeZcs7UhaP8lV7PKyCu9ObH9q9VIQCRa9hck
 oO1Vhe2evpkXnRe+4vA03tCA9z8l5z+r4XECAB1O148QJwNeBxmfEv9KN1jGfz/HXm1BlVlemQo
 ATG0MGJY8mfFqJE1pBeu57rIShrWDcMc8e3YOWJj4qZKUKgHh5/kRwBOdX3lUUNIEI20txH0aOr
 o7W2fIEtY+ao8uVfC5Dp9TJ87ZbUfZTHhFiOwoeh24UpEL/tk5vsZiygpKfIFOLV6XIfQNjZcIP
 /b3zCkH9nwobOuc1PXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
