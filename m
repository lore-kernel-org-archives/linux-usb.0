Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CA544CAE6
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143123; cv=none; b=iXmNEaoKN3rtGM0aEZDS5wcRGXMtQNPX3De1mfPao4VQCmr+a52p/4ArHW54OO37aZrTCD3/OdP0Dliw63GJlzL6QifxefvYiO1n8c1Xo9FF71HiuoWiAuYcQd5mzhimSx9aka/YBG5uOfz9mD+QXjRL7zwFV3OKeFqwPOqw8V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143123; c=relaxed/simple;
	bh=f6z7Tn/D6NJP/S0YclENgGNg60kYwd6KWpjGnLoVnWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ei9dIyi9AGiMgDT0YEfyRhxnCpUIh5qPs6q9XVkejxJ9Kek95OryvrNQZLe9OEZw9xbuXDdnXPmQyWhT8G7cqurjZM2gc+bpO7X2yrSqPKqPCl2RLwF3ME0HnaqI4OnyPUh30fE/rqjmjX0sbKL4KifnRcZ2zCerZ6OaMs5uT1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgmJOUGY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gh7klzyE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kgmJOUGY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gh7klzyE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lUrt2885462
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 09:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7mPK0sVYw4TuEezWMDdoZ1UO
	LApXxKGgtI6l2erly54=; b=kgmJOUGYAAhvHGZtwQQEHW+eKSv3K4fBh4KDrWzl
	CR9OSS2PGp7qG1jgcLd3nGULVrR6vMsj9m3TPpkxWjFE8K09wrFsKt8AuYvhuJsq
	a+sKtrkDGVD0dIPQfLVMstavx+ba5kqCFueWTNf5efxN67JysyysFUjlY9uLfzdj
	6sCFimDozd6fJ/sldAHYcSH4exvlJ0IJFHQ/63sD6HinCNyaDgJhsNouktin2Jqu
	vNcVLLGOj8UqNAqEHtLBiXQC74SXxNeNr5Wc31VxwTS3i2EtNf3oQqhCM9YOHBoi
	3skqgdUUjQ864PU1gQD/7mnAfzBMGBy/SF9Xsczv1PUAkA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba261ngj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 09:32:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so17383163eec.1
        for <linux-usb@vger.kernel.org>; Fri, 16 Oct 2026 02:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792143121; x=1792747921; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7mPK0sVYw4TuEezWMDdoZ1UOLApXxKGgtI6l2erly54=;
        b=gh7klzyE1FK++Cwt6MKWhamf0eWCBEG44itGnl4OOujEYbg4zqfD4ejSKlEfONS7UJ
         lXwY9XVlXfqiLyXP91rwjeN4qT9L52iIryESn6eSeqZ1/U4eG93O528p24PZn7UxptTZ
         RfYykd469wlB5hDmS4NKfa85etMKLrBbT4qfRZvwJu2GVQ8cbEyyVPfBbs3y0Zmp1nFB
         D45bOrLVQ00VJEaWd4rrOwhC/pekiVLvBjRZo9btYqUAbVfFhfHcTZz2ErCq7BxqxJr6
         QjeK/huY0jCUSKOR6p96rDfeIISEoM+OttLG19rAA/jqd7+/WUz1HZ2cagg4snOACFI8
         ZekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143121; x=1792747921;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7mPK0sVYw4TuEezWMDdoZ1UOLApXxKGgtI6l2erly54=;
        b=ze8CdAkdrYTUGh5VbBOOYAdEo+PXQhvd5/nPP1HOBdeOnHk5Tk71o4jxWPXtfTd8il
         ep4AmJ0BUM+lkQKXwFuD4rK9lM8dLE4moozApz2PuDYUiaaSBuMNSF13yf/sJJJk0dDP
         v/ZEstYXIkguDKhUpfS59xWzSaz6kRZzQd7n/Ef23M6NVC6a32aXb4hgtLqpt1BrslhJ
         V3jqSANUAnjQAp73c/n6HddCdiNthHIU/qK61nvNVWkPuY4XRVcnTdkHTUuduIiQScy5
         qqq87m3eqUMbZ0i0lCrDMVlOefgEuTLPklTBvICdOXrJpXCfE422GymeYS+q8qE8McNj
         68Ow==
X-Forwarded-Encrypted: i=1; AKwUvBzrkMi8fajZi9EccagueKNUnG1bpzOh1Rg7azQlA5nNgbBJaZ9C2cS+GTj6fY/E2Qrgp5p0dvDMjxk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqpsAZ0eySYqInymaGMMiYKZ3vyq9YvLAXkfMmTAlQgFSIwnBt
	ooDpUynGrYDu0OrlmiVzGlbXts/quJIEPZaxqlsz1NnzfeM5PlqjhB/MtznBgh29V2kLx+nuiTJ
	uAYiToHDNqJl9Wdy9cuux1ahYNKFjHZD6ekYPnTc/D4ANO6F9/2W4j01cvO7IIkU=
X-Gm-Gg: AYBFou1xx7jN22x0kf1I0/x37sc8vJZU+EegR7Hdr39nmOZO4QD4pjJK4HJqseW7oHt
	FMtz3VsAdkJ0YwJ/04k5BjLwYZvpBHkhAZQnQpHFHCCoaLqSXBP8k0M4qzZ79u+vhZREIM6IP1O
	HSi/Ko68SsV3hWWXbmD4ZZ9MEyseBCuDwSNOF7l9sa/5NxCcueDQFpW0euq8XtKY7RqpkPxrqIO
	5ln+43LZ92zSJispexukn7dExVBVPS6/RGzzzanKMAvkyxpEumrYIYAQdiFuZp3H3WZVjB+Hq6r
	6hVXmxItYgyS9gCgjlZ2DolWwzpTrSosNNbHSAJPtj5IHTmkYGzc+VK4bh3NQs9EQEGKsvpxgWt
	Ms3RaROXsZ7PZTYwVTM4thPiJpiBu6fWGLoh+5bNBErPqXc69
X-Received: by 2002:a05:7022:ea8a:b0:13e:6efa:78f7 with SMTP id a92af1059eb24-16a5dc00e99mr26848778c88.15.1792143120620;
        Fri, 16 Oct 2026 02:32:00 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8a:b0:13e:6efa:78f7 with SMTP id a92af1059eb24-16a5dc00e99mr26848755c88.15.1792143119997;
        Fri, 16 Oct 2026 02:31:59 -0700 (PDT)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm7170569c88.11.2026.10.16.02.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:31:59 -0700 (PDT)
Date: Fri, 16 Oct 2026 02:31:57 -0700
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: Re: [PATCH 1/1] arm64: dts: qcom: glymur: Set
 snps,resume-hs-terminations for USB controllers
Message-ID: <atHvDcClXC3smt5U@hu-petche-lv.qualcomm.com>
References: <20261016091336.2715717-1-peter.chen@oss.qualcomm.com>
 <f28d3582-37d5-4443-935b-615a7e194767@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f28d3582-37d5-4443-935b-615a7e194767@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad1ef11 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=p_3MysCZGzSAKd4OFykA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNyBTYWx0ZWRfX340gdtkMfS7w
 dy0rx8YwreHilWiDEdBQr3fzaRB3DqKAhaUmEl99BhM68xBXFvC8uISbxREJYLI3Jum8yGAyeEA
 6ZDeRb+KFKgFZo4qrx+RPhtt6omF813GqHiuNXQmix0iqdxV0D5wu4VgJZXx8P7bfjBNvk/ZdBp
 1heucEtaijSVI2C+yj3iBVwKIduTCjZTOCdmLKX3pa8yFxWdUq6/291RD4MiTJe/jcx6bmTs1GB
 vYeFps8P60idesmKVTr7YmB3c1kv0xlCcRNM0DMSMljWqB2mgjJpf3vLA6O8dXkvl3nEvlKUi9d
 Cy1el1YH37PsQ9U3YfT6G5Y1iqcgTLH584knMRZcOr/z9gFGZKpgYSfTQ5Wv5DGWgi+5KKIlzNa
 rVoBp54pivfbauldAoXc3ZfoprVurR2g1ViT28vO/8p/0tyx2r/smR0phC5U0GbpG4bwukxfWDc
 cJG+mY52hTDtFn6c33g==
X-Proofpoint-ORIG-GUID: 92GIrat62zF7B1_7otLxkxftoJicuGNs
X-Proofpoint-GUID: 92GIrat62zF7B1_7otLxkxftoJicuGNs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNyBTYWx0ZWRfXyBcnN/5AeHJr
 bk/ZcwZWkcG1Xx0uu3PRH5g2goLEzUPDA3vLED0867WIm4KTZ6DGtDqiKMZKJ/IDjJQsEFu74SC
 G6xWjeZWnIl+cfKIKpnt8XBDTBAuRuE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160037

On 26-10-16 11:24:05, Konrad Dybcio wrote:
> On 10/16/26 11:13 AM, Peter Chen wrote:
> > The DWC3 controllers on Glymur are paired with the M31 eUSB2 PHY.
> > According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> > (RESUME_OPMODE_HS_HOST) must be set.
> 
> $ rg -i m31-eusb2 arch -l
> arch/arm64/boot/dts/qcom/glymur.dtsi
> arch/arm64/boot/dts/qcom/kaanapali.dtsi
> arch/arm64/boot/dts/qcom/hawi.dtsi
> arch/arm64/boot/dts/qcom/sm8750.dtsi
> 
> Can you send a fixup for all of these?
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Sure, but I only have Glymur CRD, can't test this change on all hardware,
is it okay?

-- 

Thanks,
Peter Chen
