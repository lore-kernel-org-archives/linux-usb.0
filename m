Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E194B4058
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405644; cv=none; b=mFyolhqvrKPmokI/yhZz6gTieyTYjb8IIuOj3x6BbHJE16vKaIQ4JmLmqwPCvxL2Sdnj39bQcxgOngeVzx7nsyQu/yqmdiMUr74R0ap5whwdd/oywu6a2rhVltoCP4dwRRuGKN+UQ50YCtXBaruaL9LRhbpk5UjacIqdVWfmDi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405644; c=relaxed/simple;
	bh=G0TMCk6eWy1Ejr/Hn7WT55P5PzRQ/ZPO9noGVtE73JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lNv4JGM5xoAJm2ftqFVzEtvM5ykEYGoe5w9M/C1yUj3DPE7glWpfldVb1RxHMozRTJ7/ODnrCPf1rUJh4geweM7lij6XgAk/OH9Dvi4VZDD+066HluodjOMkSf8CQq5x0eJ9kGtVC6UmfFtGFuI3uoN1kitCj7qyuoICyr7bHac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i65CWnpk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SizOOSm+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i65CWnpk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SizOOSm+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PI902754637
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 10:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=R5EGq4XGknk/rOZMg67W5T6b
	1dC8U3KSoO937QnJM5U=; b=i65CWnpkp3zl57e1ESq3D6aI+WdZ/ecnzxNJS43K
	EJYu/BX9E5a+DSaNLDFKqydOgC2yK8CvF7oH3N7vTLzVpB0lwFJePssQfv6MPBEK
	gMlmmNMkSoo0pPRPz1w/9Ugf3pQOvHz+CJQ0vW8dfm4D6EC/cFDes6Z4u2HTjbzP
	3EFPFVyMJA/rN6sLcViGuzhJ9bL9ZALhCmnbDr4Nr3j7m3m0teyAfAXmcL8sK/Y3
	CSNwPqP8O/hT/+I9KS4FiE0SMaDHLpQ3DEfYDiKWLTwa1FfLPF7NKKsTQsndEbVX
	GsFZ8+NaCn2jmjQHn04WtpCvVHjJQMuvxpTnulSYPCq1yw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48gksu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 10:27:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so424973285a.2
        for <linux-usb@vger.kernel.org>; Mon, 19 Oct 2026 03:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792405642; x=1793010442; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R5EGq4XGknk/rOZMg67W5T6b1dC8U3KSoO937QnJM5U=;
        b=SizOOSm+lGP8Pt9ZR9C4ygqLgiTkj0Y8UPzHQr0WgGt7yVB7fxmorZ2/XeWAaWfw6z
         FjeAcXRT/dvZlkRyeBt/7V7cSY52wxUa7rOjuE9nNQLwQ8x7tf+FsJEzZNaACW1o6yny
         FC5sCTxn1o3V+VkKermK3tJch+lWsQMkMUaYc+3i/6hOXvaL9r6gqQmrdFz6wJzgYARo
         gtOCoaFUPMqEOCm4DZ3hgZQa0ddDXQuw0lf6VSYMs2CSjX7Ueo2bIC9IPRvnUgVILuJn
         cb7GIqgjnDEvDQs4m7ddzTXjOFtx/Z4IqgEpNjG1ELb5Dc9u81YKC/bqh/8bTtqbuGEZ
         tMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405642; x=1793010442;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5EGq4XGknk/rOZMg67W5T6b1dC8U3KSoO937QnJM5U=;
        b=I43lEoVRNwR6lqN1yPwqaJqkQNgb5mztQDaoNE4iiM2f9A//8e5C/ONAWeQi4LiVZA
         xUu2EMD3Kc+gLAYn1pvNYjnLLcqs8r57+PaN/MD87G7fkwkWKObq/HjC1px6zAvD5Hdi
         IwmiTejZqGs3B+OXpRmIq1KzuskKsGhVUZYoG3OGXB27D+rNLqGMr2sdTJWY0G45thZZ
         R52GAE7lfsPXq2ZXvWdG/28ypMqHRZk3S0v/G0RF66gRNZdbPeNN2iEkIJiTPS4249XT
         314oc/v3ik+birxeADLyz5fig6jVlBrjQgDRjriawGPNA73sd7Oc1UkFvL/WtFm0Scb1
         UfRA==
X-Forwarded-Encrypted: i=1; AKwUvBzRhbjn1hhN+6JeE7sLE2FZacZSNc2GbMdXJRCRvW6rk6gzcXQZqx3/5cj8POi7P18qoZeY5XbKVo8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHMrRFBYVfuCWh0ZfdbSTKbZmSXgSJSEsXkUINmSwQZWPpdx1T
	uPfTyNMtQ1fbOGZXX+jTPElsHW+gd08xdvRHqXMBmi0IZkbm8uL+wSp2RF7mYBb3xi4H1agwEhq
	zm+FbxKvuz12vT6nr+GRkjfWikhZUsfdKLi5zm4hsjnvGp9Wo6sDhVt9qBiVNuERDjx8ds9o=
X-Gm-Gg: AYBFou26hl+zUB9f12mUXLTsIuhEUzHnQLmI5NZ5jI5DXuHW5qS2wRIsYdc36/OFGVk
	H/61SSws4/QKsG3wAOwMTmcSuBNXGiRTykCItSxqEbbCToDIB38OWumIhg7UF9A1BcFj5zHB4KL
	qN/m+BBIIgv1Y2C108dMzex86NUo2Q4lMgBXrNzMz4uf/XytdzFOmPhpajuQTZEsRcJdpDybEjb
	nJAWoznJTrA4PqGfwebvuzljrYk/uR/EYfrxa0xzUzoSpGJsBzEq11HokiRPRSrcIzP3oAzMoAX
	5E8atZtb/mjm121twukSPBCW41EHKHiKMq0x0aT7LFDUuxKSrwqwdClYEirr5eZbFG4TUWHOh2q
	DwMaoMoPAOR8Bf8uC
X-Received: by 2002:a05:620a:40c3:b0:93c:8544:6adb with SMTP id af79cd13be357-93f29c9716amr1228847885a.22.1792405641384;
        Mon, 19 Oct 2026 03:27:21 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:93c:8544:6adb with SMTP id af79cd13be357-93f29c9716amr1228844185a.22.1792405640771;
        Mon, 19 Oct 2026 03:27:20 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm21895264f8f.30.2026.10.19.03.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:27:20 -0700 (PDT)
Date: Mon, 19 Oct 2026 13:27:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: sm8750: Set
 snps,resume-hs-terminations for USB controller
Message-ID: <4vqpw6q5tgivxp6fqkndblg7mztagnlyuglytn5c5ej3hmse5e@xqmioqeototl>
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-3-peter.chen@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019021547.1694088-3-peter.chen@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX7320Qi9ftPCL
 g+FZ66uUYqnX1ZvHgYyOx4dl2Br/g6dk3sXoUO+88cqxTvXz7kWNPBK90CB/a1ycTQA+L5dne2V
 +KeY67syU6LjD4cAHDHZ5gfwuG+vsohaM0OAmj6Dp1i4pxmvL41Lz2/eg+YajiL9kS45Yk8Y4td
 jsuBWLUpbIvu5pdmdR0wEfm8HmE0x6QShRITIoDd/nR4busY+OnNDHPTQRk/15sQwKbFa6gotuk
 sXjj7rPrvb8oiCNKImHkWIxPSmDWRG8ro/5UewAsVCUc6dJpSvZsZq06RovV5O6GCy6CJoEhWSe
 OEFcyT9k6ZuPA9VYXxCn4IVTL7ytPCYo5C0Zcb+akUZaonACJUkbKfChs58lhybpJkm5tZsyh3O
 9zSMneCgmOv2nnLIIbRUj0zP9Xp+W6AuaDOIbXldJpXubRzo0i86zwiZ4MXmqvxrhdhyzhIHEaZ
 aeUqBSiPQIDXKf2iGmA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0MSBTYWx0ZWRfX0sC79umqEvh8
 GBXlED81DOvB1FPhvxD7WArWT9ufArZiZ1kn9WnFGrOkRzmK2EdcnxmkVg/DMsNI1ttzFJ4WCrk
 H+ZOfivdNI5j4H0bJaZLUFQjLw0Uvjw=
X-Proofpoint-ORIG-GUID: G4poOVizZzWQyNcJSDAOymLpUeOt4aX4
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5f08a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NkzuWOWtXKdz_VN5Xb4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: G4poOVizZzWQyNcJSDAOymLpUeOt4aX4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190041

On 26-10-18 19:15:45, Peter Chen wrote:
> The DWC3 controller on SM8750 is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the SM8750 USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Fixes: 7a5bb9f60527 ("arm64: dts: qcom: sm8750: Add USB support to SM8750 SoCs")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
