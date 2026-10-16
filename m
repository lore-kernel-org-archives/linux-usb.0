Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105D046C846
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142653; cv=none; b=FSFNOox48//lqy82csX3PZopMqMVGhXJUGJ6aZrK3G9elxFIF7tVFKyH1uTuVxzWJEECYchAY/gC36cn7oKH4Xjy1X6W8MFI+gJoPx3/6ApTxXT7DBH/ufhDLVSes6BV25Zg8mWQX782jNOpwv0hxOW+UzQRbeCykMfHvcwMu0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142653; c=relaxed/simple;
	bh=YLXcDiriQixGR/41m+S2ocNy0kvrwbNXY5R1ytsCdd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OVrlrLdEKPaxLc9YccgZp05qTCOm3GWhaTJiWWqo5po4VQEnMXnHEk9Ej8/Zdjop2vCCMJ1E1VW4o2ydg2OOB8do2xwyjrdZWXsCTzH+G57+P12UmmYH4z3HYSsUeuQtwEHyiqM169f0aM7frbWOd/7v6WnuSCZAvqfFlVji9gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCLIgTm1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ek2f0PCk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCLIgTm1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ek2f0PCk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lXOa2815502
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 09:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YLXcDiriQixGR/41m+S2ocNy0kvrwbNXY5R1ytsCdd8=; b=FCLIgTm1fPMohTGh
	t4ewJk2jnTmXLW47gB52W169u9srbxUtrnezDLYoVxKvGs87OD4e+egrLAfcI7z0
	DE3GpVE733p3AnsijNAnjjESrbRZk0hn4UIBcid4lCoBeODS4aJPUqU2qWOejvno
	+1qmB1t+7uCK4ELGfGNdC7sVkCazwc/84bEhaCXlYcxjqX2u6aHAl8PTSUvwIJLm
	nwG3Up9q3ZkT0lS/63HCT6hQ3A2DJX75RnCnkpSavhPiLQMnXIu2R+3GsqWNE3u8
	vpiql7U1JXm/3QjsEZHkEkytq10jEk4clS2RlI0bhSry2GJ3YygoEBIGtSW9QkWp
	/nAt4w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r11vqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 09:24:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f12bb489aso19414985a.1
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 02:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792142650; x=1792747450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YLXcDiriQixGR/41m+S2ocNy0kvrwbNXY5R1ytsCdd8=;
        b=ek2f0PCkduMSDteWC8jxPRMuhdksYg/C6lrRf0H1T4kv9q6mpFlpgqVYj+Wyg+++RI
         W1yUv9t5YEd0FC/fflCE6tAllpV2yAOnJKX8m3A2F/U5P+EKrngHit1KndieqQeH5O+t
         RkJ8u/7wHKhxtHYIWds3nju3x3E4TqAmsfSZno421i5XXWivYndv3dMcaAKsrWNQTfPo
         2pUwaf7yzs0i0zr3A6UR/iD1cwW8YiEFzxe4wxMH7LMK0zw5YOFan9Hfx+f/5SasdS3U
         I1odA7icrViIOZA2Ek5SeeQ77rC9jH0BdUInUIKqVs876egKaRSPvYkwiyc/bDKcC8pz
         0knA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142650; x=1792747450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YLXcDiriQixGR/41m+S2ocNy0kvrwbNXY5R1ytsCdd8=;
        b=pJbc7PsQfy4czQmSskhK+qw+E05lx4XywgolhRtwxbYgLBRmUsO2qCuB3bQRFGiKoJ
         7QlfS5RD/jTKDgEp2Rv2TiFzqdmbEkJovNkRpkWcJvTyAq3RXDNEpm+us411gEiVvnu+
         alQzFYq3dMOlQVykNcgxNn20oEpSyXGfNGx0GUMReFAzZwGbhQdVqVrJ2BYh8lWlwX4z
         tgNZs/h50qM2qB8pafVXyUqys7ztejeNPEUl90TkrG1oVLtKtVuvRHVZLbSEwoaqb6zx
         3dV8Nnpn+vLd5lPhXZzykggtW7iSkZLuSgDyMpdGuhduDl6SqqeWdE5VQVKMkTJtoG3U
         DmmQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0R7LTYcnn4SkeaVRmroyLUDpYdXbq6dBYOJeJaIcdCEAAI10rNRHxX2Y7iukECtudY57GqRadE10=@vger.kernel.org
X-Gm-Message-State: AFq9FYKn5Tvn3o3ArfQW25yHJsYQaOans1GBk8t7iNEpz4nQk3UgmBPC
	FSoare5jPTBqm9eQc2J0uJgZ8q4/PaGdeheqWXkZjvW9aHD2BsfwoWbJHOcoq49r9lIlpnEgUjO
	TR5WJ8RgQToVE16nBTDm/GNx5LxyTROwdny8cj/bKX1zKbH/aKifDBPg3TnWJlUo=
X-Gm-Gg: AYBFou1R1ub5LdQxe/X3AeqLwP9fnLnSnkD3XEzFdLaDN9XZeHLFqLjkv0mS+f48dew
	zzsA3RF+c7ORxKnaetQ1loRfc1mw/geTBxSG7X4fVWbf0QjpmIHl1CyI3CmdV8p1rfbNtgcp3fC
	j+sRUtYWvTLQGT06z/t33KQ8r74X8Nq/xkf7SfvdbwUmfGPk6jJKT3rNNsuPQtA5SvX1mk/N95R
	nhMzlJ+J5hgJneY3XSCukHNQo+MfZbp7FEZddzE+LfBPefCyiPUW0PiAwvI+sVs3JQ69Ca7Gu+s
	+8cENuGMgTI51ygDwxfa/oMf/svznXOdjsaH5Lz+nsJgJ5xQfxRJ1KT2betlUyutkrriLmO/QAv
	ySSyyDEsIjPmtNjlY4lAUgA==
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr3730187185a.5.1792142650167;
        Fri, 16 Oct 2026 02:24:10 -0700 (PDT)
X-Received: by 2002:a05:620a:439e:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93ebd264008mr3730182885a.5.1792142649736;
        Fri, 16 Oct 2026 02:24:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b19f8sm661345a12.7.2026.10.16.02.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:24:07 -0700 (PDT)
Message-ID: <f28d3582-37d5-4443-935b-615a7e194767@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:24:05 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: glymur: Set
 snps,resume-hs-terminations for USB controllers
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016091336.2715717-1-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016091336.2715717-1-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _qQ2q667UW_vgo0dtw8LLLzI3bAPDswZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNyBTYWx0ZWRfX5uIQPMR7sCi+
 UhmBv5SF/q65TnYiNwy7nOauc47sa0/oIPXUhqjhLS+/EvOuhE0dtmhQGPiegtysw1UTrrhka1e
 MDk1nonX/vT9lRFP1nS1qtVSrHhfAZ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNyBTYWx0ZWRfX3inbZ2ARkfOm
 3pphxM2jxUh12H+qXbVUxEk/DYMvBhrsQ2R23kz4gozVwteTq9YVtcBfVqMvdUOGQnMwdVpiN+U
 XkGjZ8xFtrXZNFMzcRnUP/C8GET4ESm2s+4SkTBqeSIjOWWnVw9Rv0wkQTGMgAQrlF8wreDrnyy
 +FYo3cFnPw9LTrnVeAwtRStYfx7pAZ4TKgqVoH6SJCGhgDvVoPddb/7Qpr+aQHbrQZOUIeb1sfK
 PfD05/aOdT/Pzr573Iw8vC4bjaw4BwBafE5rN3tuFV1h9lYN3HqOPgr+086lGOLiplQomzOZcy/
 XuHXDslzRY3M8SxYUtelgbortSPcHyRd+ymjV3rhojkr7Ib1BFKtxMJcIdjI+Ehw2bhtwq1mQDM
 P1sHhmGWFyqU4Umvg0jVuqD3NBxbVv8axANa/JdMifWE0V1ED/9/Hm3iVpM0gc1CjuJtt8UMYJV
 iMHfNiZo4pNU7YGgOgw==
X-Proofpoint-GUID: _qQ2q667UW_vgo0dtw8LLLzI3bAPDswZ
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad1ed3b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Hm02htHfr-OdaEd79JAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160037

On 10/16/26 11:13 AM, Peter Chen wrote:
> The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.

$ rg -i m31-eusb2 arch -l
arch/arm64/boot/dts/qcom/glymur.dtsi
arch/arm64/boot/dts/qcom/kaanapali.dtsi
arch/arm64/boot/dts/qcom/hawi.dtsi
arch/arm64/boot/dts/qcom/sm8750.dtsi

Can you send a fixup for all of these?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
