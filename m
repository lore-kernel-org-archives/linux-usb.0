Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893291;
	b=No8ewawodJ3osElN2exLqnK173WOyqWuzUc6EjpfyR/sJHHkw6ehnNdY8WFztt687CGY
	 LiQymPL40WQm3aS/g2/k9m8QJgb1vhEmKWXyAYz2uc2BOe2XF1JwsJwVDEfJ6qRYfUqhu
	 u+LTnvNbbC3XWJuKO4NK5FJXtri7GZAnU8kQVCPSpdETNtkQ9Y9vlRjaGiAyc1hHzRK2N
	 L1jwyP38UIlk+Ap7h2F0/SPxAwSFvog/n0kLGZ6KOokVVqGWawKpMflmSKqaPWnxT98rq
	 ywv0VnpfzuplXSVNuAf06ekMAw+ImtbvzSv5daO6Wy41sbMMqInoODqDFwYuOkOGkEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893291;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Awa0wQxPvQl+swCe31Qov+6CjnZ5Z0uiEbtdtcWfOF4=;
	b=eNUQCttMK4Fsf6O7fwFTain9BK4HSR8gm/VuvpNQHWnB17NYaxpl1GDcqWKtOD2QK1c4
	 8WYgtWHY7nz5fjdA+gISFS+kddXJWN0DRnxe+vSicTck8+PPln7eTb8Ul5MBXjCD5Kdw7
	 xbA2OjxkYF+jMLSDW9pz0fTAz9CBjoDss1N/V6H5TgIdiFZVfnvtiPJBpOSljwPTKtrmZ
	 7596JA2D+lk53iAgBEzkNENIIwmy/UwdFH3D3Mrkdv+k8+diCal+MBheBmjsT79gbIq1f
	 YEWU0QJSkmbVAspXBKOWsqumzyXzNWG26GEaI6mJ0m+FhlaJyTXv0W95/xaTF7lJifQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV35Qm96;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdTZoXNu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969B3606A329
	for <linux-usb@vger.kernel.org>; Thu,  5 Nov 2026 15:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 969B3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jV35Qm96;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdTZoXNu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5EQ8OQ094492
	for <linux-usb@vger.kernel.org>; Thu, 5 Nov 2026 15:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Awa0wQxPvQl+swCe31Qov+6CjnZ5Z0uiEbtdtcWfOF4=; b=jV35Qm96buL+DzqX
	hU43ReF0gjg3i97yPfe5frMW6EEnCnbpofopePaMSCOyDaiJETNBGcM/+LtODIPl
	+zqdPxnfpyq+015Sf3rcAs90YMRq7Pz97dxSfgyVNnksKC0FElyd2ZGfaCb4cJcV
	qoFXb1qTBaDHymbGe1SA/rM8m1Dc17aXNmOVZxx9HvZRr7gxiK/pJfPQMa3qM5t7
	l8ljIil5whHILqlMlWkLO+U0KkXJoHFjiR4a3YxplPv+NmOlIIE7Kg+Lrai/1Ujt
	QZ6MUkx21fpMEIhA+lHBME0b+1ZLfdLg5jobMLAs+ZXqfGSr/h4HVhYtGkfpE/HS
	Crv+rA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrj43jv3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 15:41:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac5877bso20861185a.1
        for <linux-usb@vger.kernel.org>; Thu, 05 Nov 2026 07:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793893289; x=1794498089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Awa0wQxPvQl+swCe31Qov+6CjnZ5Z0uiEbtdtcWfOF4=;
        b=IdTZoXNu1NdxxD4uO/gPZPpW5dNNnXrHlBhOkXkSsB7w1dE+pOaZ1HI4rRje0o7Kms
         0oBxIgGBnGExbhB1Ck9e0IRTfcyc/mHiSUhIb85mNK0c7kPC/9i3cGSoh2ToQsevTwbH
         vh6Yjg2JSJQcLOGQlrqzh2F7PUShcfkjmzru+w9qiTEJlwvrqV/lr507E1uspyrTUxJi
         l4KF+cpGIKveQww5hWQ0RmfoKEWGnD5l1CprkzruttM2SoDChBJa4FwQgLpByuwvflJO
         YmLEX9X1sirM8YiIS8dy+zLP4GDNXi39n96h9S3Ejty93Dc078Bxr6kWMlKkmd8WVYVB
         THJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893289; x=1794498089;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Awa0wQxPvQl+swCe31Qov+6CjnZ5Z0uiEbtdtcWfOF4=;
        b=00Teb0dylaYuZDIlCi3X39L/bmyG/BFLX4iSws4MTtUfk7nIbkwjMpCa5STQA0+hNU
         tBnfEyuMjw2bYqmFIbwTW9Uz0tQYLqAso1RFPs1wqllW+RmOtK9YsjdbqT5XFW6Mze4o
         HxvV5h5ke7UZcOWO9pGeTgbUGML5HrUfYzUZqWdU9bH0po4mCEzVotFTqsMpLERalsuz
         /KheQZTzw33I6CjRrqprVa536+fgHkl8/i+2URdOtVuUtdgJYglYfarc1Shz7Z3ml8cD
         dmYhZUOHVQRekb4JLnmqlfrjAefjNCWg621S2d2p6B21ECKxCVjTTn0DiLRs/Ar0qc0b
         Zczw==
X-Gm-Message-State: APuU4Z/zrQydjoGrgfvoqiyzab/e66O+4iQ4frm1tYyRZ+683pzYawKr
	oOh/2o9rWNkQY7R9jt3MrD+m/EGrDA9ehFJxtEFsWCscmuOvCSi7IuZ44vNqP2GSZWmC96w6cLA
	4aN4g3Y1hL21E1FuoWC/o08WfnHP3GXNP/z3v6AvGuwSGWQljfkvax+k0anaCn2c=
X-Gm-Gg: AYBFou1FmyMaUSLcZxNyYNDgVqYEN+PCtAl2tj8lN079hsfVox0H8+PNgwrr8TVyvhX
	FUHwzD1WKt6RgAWazefmOJMtHdzUVQQKU0Fr3Oy+yHoSW4y+Y0Un6yzR1Muu3WYe2NtLixBI7GH
	R4wv4OeQxShEDd9UEYOt393wz9kj0TGBpdqfKONSPCI0Y9fiM/Ikf+ntPq/5ZdWzvwcJ0TooGJ+
	iUcvkbo09EO/LzrFXEKNDJuujy2ya9+wLmU2HTbi/+HKC9cp0PPEtv8If301FDqZYdbg/pOFmYk
	elN0TtmD/OE1pU7Y4f8oh51cHuJvblux3Dy8x1YB23VxHiodJHdHpS7jV+rBehX65qfXDXbbUER
	E9n66RoHtJ2TB1RlceYhv2tH9iDujctg5nE/6t5lgBMA8seAcYQphrpbjxbHjQxKOD2dM
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr2911442885a.4.1793893288382;
        Thu, 05 Nov 2026 07:41:28 -0800 (PST)
X-Received: by 2002:a05:620a:3c87:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-94421697192mr2911435285a.4.1793893287451;
        Thu, 05 Nov 2026 07:41:27 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55ac94e8bsm1729432a12.35.2026.11.05.07.41.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:41:26 -0800 (PST)
Message-ID: <e2847855-c096-4aac-bc85-386f5502131f@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 16:41:24 +0100
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
Subject: Re: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AwGPoPralJ7UH6laB2_Y-pL_DSytci8W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MiBTYWx0ZWRfXyHgO5U0/dlBt
 9Yw/RB5UxXIWnU6nCODUUwk12BcFZIQMoVYctTSg27hy2tzdk18W9g45Dow5nauluMABCnWcfIq
 YdC4+9CTCPS20JgqZVoBH/8ofzfq5cUzjr2LgWGV0iPzqyB3kkspbLMMbyxvZLxeIDUPWbzyDIt
 RIxlQXBWHbZAAOK2wBosv1XW06/gLsst4YwWZdF5q/6pHgN9zMj1WR2Ctftyt63wZ9IrMUzfWhk
 BG8RJuVjRiADkXpudl21PqzM0SUXEgWYKaYrWiM9jEbABymwX4Wvn0DBo+VjNWioxfHAPoBTR/+
 ln64APBzJ9H10Nxgxse2GMwynId33b33LKQu6LwSQnZTd7AY3vyYpTshHUNRoo08JyLIdfGZFSq
 ZEJEFKYgEpnSdBU9aK80v7EXkXSH302gspjAkAwW5yqKB+wBPNyZCUjAEgT3TODwZioYuWiLfXE
 CdvX02gjLTi2EltLblA==
X-Proofpoint-GUID: AwGPoPralJ7UH6laB2_Y-pL_DSytci8W
X-Authority-Analysis: v=2.4 cv=SZdi5fRu c=1 sm=1 tr=0 ts=6aeca3a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=3XAOltBAYhvOEWtE0EsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MiBTYWx0ZWRfX/4gR9p0vjrrr
 pcrs9br81FAzl4cZEP7IvswXeD5K/X8s2qcBCU80uGvgtE739SlAJFoI60oCSfZYJR13GIjwLcW
 LpI245egIYWGgO3uDQ7+EDTzCoe9yKA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_04,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050062

On 11/5/26 11:02 AM, Akash Kumar wrote:
> Increase the nominal max USB memory bandwidth vote to let DDR scale
> higher within its nominal corner, fixing glitches seen during
> simultaneous USB audio use cases.
> 
> USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
> MB/s, ~1.8x). This ICC vote does not by itself determine DDR

Can we scale this depending of the real speed of the connected
device adjusted for the real data throughput? i.e. if we walk
the tree and min/max as appropriate, we end up with say 10G
wire speed, out of which we can shave off some static overhead

4500 MB/s is 36 Gb/s which is way beyond what USB3 can do, in
any configuration.

Konrad
