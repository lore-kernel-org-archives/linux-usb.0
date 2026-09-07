Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904734A5C49
	for <linux-usb@vger.kernel.org>; Mon,  7 Sep 2026 12:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785840; cv=none; b=bmR/w0I3y7ijbIgJ3icRB3pOZ8yUbLU+2eqc1rquBQieq7N5F/InM278r02TeSwunwphPxYVbMUeyMhISHhJFNZNihqnGt/tljR/gKlxvVjFqLa6FbXBOEDXYGovvayp0yn+8jaqvX9PJhVDAlz9hn3F8W928EFxKWhWD8JrN8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785840; c=relaxed/simple;
	bh=Q/jU/CzwiIUS5/1+gDBO6vEJCkuSQCJSMr8mBk+OxX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkdYIBpmwXdKFIh51jF7uWixVMeCSQrnbcqLSyLD2CnDIyXJvU00UCPTBchGQ9VSXQVrbqeETy9lv8XxgEu2elbK6Bob8O42ii2TGqHi9D7e2RPARDLF+OlsN1KbqUq9Z3IKaK+9S1BXNjvGNj0cqRWk3IDQGFV1kCT9Alv3gLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7Lebzdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcTFQRnR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7Lebzdm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcTFQRnR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AvJWG496162
	for <linux-usb@vger.kernel.org>; Mon, 7 Sep 2026 12:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVn+zx05ZG5vgGFE3mDfxzd5a7QCiGbj35+Nu9q1D3Y=; b=C7Lebzdms5HqeqC3
	h2upwCAxlpFGF6S6/40S3On/uUXxgxvT+ZEaDqDIbGVSwXyNvRgRDWK7vuue8yLt
	6HipWeu9pOELQQZuSwdiB5Haeq5ycuLUldNAWJU1zTo6Sosr0O9lJcOc4RuV8VoN
	Csm2fzKGNn9vvRPBPtuetUX0arXMaRlhQUKNWPS3XeDzhfSDrfW846fod5f5onWV
	goAKi/9PGY/Uh3HLqwvmQ3eLWUZojTUOeau/HrxeXlF6b0xvH8EVAreFXfJNsGxU
	zJqKYDhP1IXF16KiSUr8cBuTUyM3YqrpVbvJkMC1N0CLiuvZpznCHrNxGUXmi5Os
	v9YAEA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghuyk8cs8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 12:57:08 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9102fee9920so7509696d6.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Sep 2026 05:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788785828; x=1789390628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVn+zx05ZG5vgGFE3mDfxzd5a7QCiGbj35+Nu9q1D3Y=;
        b=gcTFQRnRRnWJQcpIW5wewZzuzG9LPotcBmpB49N1vydjlLltz7mUeFEEjpStCfL7Sn
         fFQX4Xr7a/lL4GF9PU+C7kuX6mpiy3vgRYYGp9BJmZrlaPDYduXhs1OD257pm/JyaMd4
         KTqYxpdne3lSCphnT7xcjhPYNrW6ddsXBSl5Dy9f3e6HGf8fpDYMMLWN1SY8EIPaXnC8
         VQ6qPlDb1oVsGBu4ZUFlVQQSfWCrAdYsdxOpL1jHqWQPEijEUzIEjHnqbVp40r1Qtkr2
         o7dBYgnaydPEtvMeBMvqGzf8uylLkqhszIyvSEjavFN9uuo0gWea2rE2bFSCGrzqfblC
         +EOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785828; x=1789390628;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVn+zx05ZG5vgGFE3mDfxzd5a7QCiGbj35+Nu9q1D3Y=;
        b=cYD6cHZUg7OEkBs3GaSuZ0j/l1ef3ElOmBtuygOVYzZ0474R3NkEOnoj0OTsXU5wVJ
         RlPyb46InLl63js92yeMJ01U84T4ld0Dx/wqqSx3MAytRByFJPcoJuPpOepfRStbh7nA
         14/55KquSzBAEA1sguNHU1Q9o6hugWoCEC1vg1T9+KH7DnmkOx5PxQe0cOqaUQFft+Gs
         IXg1tDc4xA0UlICLtgS/+DW5sdFRunPu/vL2DexlOVxbZshR+d6pLQIzP2tEWdHYOUHt
         dsVS8yFE6cUxUpvN1Mj7akPVv77qewTL8lYLJvrubqxG6CHjpB/O69z/BkYWIhCLORTp
         L/Vw==
X-Forwarded-Encrypted: i=1; AKwUvBzrQHVMP1q3FteDvAfPMwwmCCudRWLlXdLQQsFmYGVlBY1hK5LCQYj9pqAMmEvShUnDEKI42KdNEOc=@vger.kernel.org
X-Gm-Message-State: AFuF++lcjjpPEtk9tlQL4pr//7qytPx31PCvrib2a4jWn6obL2GJjU2x
	3fwQsmsU+DJ43HroMMSJgBRc0fi0JVH+dFe/o9uGGm2oZPae4RM01xvI87YU/gUi7BpKTLwcSgu
	kqSoKw6Xla6l02wkAW3RP0/vf29MlWs00Sf2rZev4Q2/zU+yxWwPQGUPSkyPg0JaUBkWcGTM=
X-Gm-Gg: AYBFou0Z/1DbnB7Ta1xvi1zXG3YTQyS50uvfIVg33sno0jNcl618fNu+Gungn4lf/dc
	qyRYM8ifILpk8z2x2sa+JVLv7FP3j6WulCcB/o7Y6mlEGDaDCIMCp5LUyUrGB9CNzMNpMLRYwMB
	kQuuX07rzRMsmR6xZ6/eVx0f/EOued7enHfd8TeYrUB64AK1xvrNblzBuNqUkJBbvZ9s6HI4Mtj
	FOESVBXfM92vI2DdpIC/oIo4h1rY9mBVkcfqf+0UluOtD5TuKrtr6FS1o6GIXqQoaocRCca30NO
	wEER0h2+9h5vanG+E2VTcujmuZmz6LPdXbN335FbdN6B2GTKB6zSlLH0sp9JL7DBPZizRquicJB
	W88yQxLrLalB9tpZB3AFssA==
X-Received: by 2002:a05:620a:4141:b0:939:47f4:935a with SMTP id af79cd13be357-9399188d614mr1231543585a.5.1788785828013;
        Mon, 07 Sep 2026 05:57:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4141:b0:939:47f4:935a with SMTP id af79cd13be357-9399188d614mr1231538285a.5.1788785827480;
        Mon, 07 Sep 2026 05:57:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5277e6sm459162266b.27.2026.09.07.05.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:57:06 -0700 (PDT)
Message-ID: <7284d02a-bfc9-4d30-87ff-32f9ba65cfec@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:57:04 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] arm64: dts: qcom: ipq6018: move DR mode to board
 DTS
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
 <20260906-ipq-flatten-usb-v3-6-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-6-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX3MwtUS3ty9nQ
 yVhKjEeidBzvdx7hzj6yqIpjgF5gfbIkfPGOsiqGB5dj5wN00r6Roa51RvnOccdIUEXIoKFh8xR
 D/uMVj7cbP3ZQBo3sDTg9hpMRD7NUtU=
X-Proofpoint-GUID: LEUgh3fUR5yoEx_cCEYjjjuOwv6eOkTx
X-Authority-Analysis: v=2.4 cv=ObSoyBTY c=1 sm=1 tr=0 ts=6a9eb4a4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=EtrS5e4rPv2Xu7PadmEA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: LEUgh3fUR5yoEx_cCEYjjjuOwv6eOkTx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX09bZzCtRLlRY
 akzxN0/qrUyakAA2SuiOsNhmhXBUxl4vu6ROpoH6zOaRoHS34bE0bdK82k4/qVIIy7xGu7xk4Dh
 8mTHBO6YXP5IghBWEuLxlAJiz+/u1YhaNoTXlta51VI48JlwQW+QmORY85sZYpcICzH9fCP2BNG
 lZFKHxg/WT4wagFjj5ZZA4bDOeV4ECGoDbzt+4vVCHrUKhkryuD259zHbhl3GTo2KA7A9ZiAflR
 6p8KMPAJXxL9/bKV8hpwclN0dRzu2/BiEutIc0sTs5o6EDeof9diW1guVCmFsyLOjCKj0IhB4nq
 HI3a4AbU+aFV4Cubkn5c9hWMXa3ln/x3/YW4Q6SAM/gJZeqJcFdVdL+5fmthP0ouwpDKzZsyQgB
 b/IJwkCFNma/muy0z5RwCLkk0eawuJmR34kMhcqItuxNu5kGeRYL7uC+VRx9ozEgJMhVHkK5jyr
 PN66aQV+AUw4nVRZkGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The controller is DRD capable, but it's currently set to host mode in
> the SoC dtsi. Unset it in the SoC dtsi and set it as host mode in the
> cp01-c1 board DTS file.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
