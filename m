Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04BD3594A
	for <linux-usb@vger.kernel.org>; Sat,  4 Jul 2026 00:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783123305; cv=none; b=AtSq7lMG92PBe2q70aVbYQC/dq2uzH9NoDBwdul6ZIdJdfMNOo8mJzQym5ROqkbWtcxjjdZM5NGxKRHsV2u26h2AnaWO0SxpP9UFN7L071U6OcEV1+45nswhU1YVgI3JqKn/4E3dezH6ej5DZ5azQcdMiJiTjj+2dtuZqbnTL/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783123305; c=relaxed/simple;
	bh=1hgoD/IDOXH1vzUGVqFb9ZBGpf0yUjB+5Uh0JCZ+/8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqqGBlKfHK1pPxkKe6VY9cvZtb0qTJPjVpe/etesixhzJNZARTkIzVxIjpPRJ+fpYmNZbKip+UmfTQRGW0Wn7NKHe3Ia8bPtpKDQUBESqIzmlMR+Ez62YB3GDxnTh+eOKSSxAZsDmJs1LpIi3kDVf0mM+iW/KUmY7yrB4WT6fI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aj6tkJ+C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhWs8x7c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aj6tkJ+C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MhWs8x7c"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPa2R837944
	for <linux-usb@vger.kernel.org>; Sat, 4 Jul 2026 00:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QQ1NaaNFJ8PFY1ShSI3u30+m
	GGXt3cQTpsIVBKABYcI=; b=aj6tkJ+CnAjtbiEG0jLWSCJIEr4rGF/Ci31o3vUn
	Uofvyifup3YZQRvJrqne9nmT808Rflu7GZNkXZrQvlJ2eOTtcBQrpUB3oicCeW1k
	oDGoM5gFRrbipWzQZKzGJlQAcrtPA3HLTcII1ltpH9f8CUMJUxlmzqW/TjupySfo
	toiYOkAqvwQv0XQN6H/uz5hs1Qqq9BgKl9wtGXMkv4sJOfoaGwZ157lsKvGjQ3Ok
	k9JezHXtJC7TXQAmDE0fgNiNlCnb0sPXKR7tj52NeDExI7FamL/nYWXcEzbRSHe6
	iGhSZSpVlhgim9AL5d8EJWhcFIUQ1Oo73j/EMDJp3/NEYA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyu4ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sat, 04 Jul 2026 00:01:43 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bd7f21101aso1190989e0c.1
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2026 17:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783123303; x=1783728103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QQ1NaaNFJ8PFY1ShSI3u30+mGGXt3cQTpsIVBKABYcI=;
        b=MhWs8x7cLODN6ulr3fy/WAzHGdPJU9KSPxMSlYoX7RKlMcLseSrcgqUtaw+KN5R7He
         bPenfWkzO1TUkmKNNCQM/rlkXHYE2S8CgtGQCbXPxdH5038ChWKhkOr26kWwzpthtv4Y
         CMnFugMe1+WDK0T4A8fGSU3dwTZApaFXauM4rbnXu9ZtdTAHoncXDUGwJD0CugFqetEB
         Utgx41LI33Co+EjcJsp/3FdiEv4ZfyNdNryfuN0EPlGIJfbqyRq0KUo3wCFcohVPY1cQ
         AHguyQkMJl8/uY23wUDMU00Nvq8PsdMUR0SylsBi04H1Yf+5PpIna9GYOAgsf0EQqKyX
         zrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783123303; x=1783728103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QQ1NaaNFJ8PFY1ShSI3u30+mGGXt3cQTpsIVBKABYcI=;
        b=VNtmo3Tzck9YO80OxamWywkSP5yu25ujg0MYu8v/CmGJaYp/r1blnn4ftsKqui5zKs
         hyqMrhHprvVdYTzjzDxumZHP1bzOQrKufcG08LkF3LZKokPvR1J+6maA6r82YSO+EL01
         51t6zDK3xgrpmrbJ8vVAH+RsgVzbIRAIYz0RLfuIfYJYPjnZrZty+xvi16TJyJFf1L4l
         Ih9+G9g6As4QoCqVob+/DUI8hAZRyFkTYnEa4kMjAT1Y7M2Yy25GSSrEx2sHt/j32mlA
         9+8eYvAPjqH/7oSS2Ys/lv8IrDWdakdwoNqnh7XP2J8VeTPjZNqn0L/ixlTyuo7209CZ
         N24w==
X-Forwarded-Encrypted: i=1; AHgh+Ro1oN3vAXqZEluKhmtVD41mLxCUUTRJkM6FPEaL+b69Yho7NjT19fLjwTBzrZqC8ZMxgpUER9g7crg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRRrwuD96L6g3ImPvauvBUortya7zdGN01pOaKhPPza8K20Gxg
	ZWlw1XSOl5z3zudQHinmdjvb2ANEONihZz/88J9U+ve5X7eOmsQiZ54jG4v4ActC/Nk1Sl29fAH
	nxGOTLiJO/nnn1IWAZ+9GqZmhlp/tqR7Z3PrXXAIFSS1d+XPmclbrL4/4r3tR8io=
X-Gm-Gg: AfdE7cmW9hRtWO2fMibQD3mqQizjEn1+//0KoLAoO+d0telj/ZEO1r1hpvLQMh5r5hF
	7xuAK7WfDrVO4vxTsI0sX5+bXvhXVIlCCLnnqLmu61ninapmN5Bj3z/1Iau2dUNtb6nEnyCCGSw
	jt244IDovwL7QU2LITsM8+FoYzwMHkOQZxr/7K25REdSjrsCA8sU8osooVMJD30OjA/VPkEYCzB
	1/w1rvYjbey54kRFCzCXeAr3VKH/MsRY1lMc93Fd5weGs8LGhnRvJUpgjWWfmRDg691wbHbDOLL
	nbFqS6h73K65NzJKzv9UA8dURyAargSz3QHGDTfzRJaIgkelpNGnoQPv0LjjlX/Aik33Ph0eQNO
	rjgKESPZ7QaU/IeynZbjyUVvWJrbEUjk3FeRuP3oVcelVAeJYAZlLXWibj8OrnWcft41wkgPa9S
	nTjz3tbpQl1SG02iRE6UjPT1Io
X-Received: by 2002:a05:6122:d15:b0:5bd:fc20:1fc3 with SMTP id 71dfb90a1353d-5be101c9647mr651875e0c.4.1783123302813;
        Fri, 03 Jul 2026 17:01:42 -0700 (PDT)
X-Received: by 2002:a05:6122:d15:b0:5bd:fc20:1fc3 with SMTP id 71dfb90a1353d-5be101c9647mr651766e0c.4.1783123302203;
        Fri, 03 Jul 2026 17:01:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bb7dbsm854661e87.45.2026.07.03.17.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:01:39 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:01:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/9] dt-bindings: soc: qcom: eud: Add per-path child
 nodes for UTMI routing
Message-ID: <ur3haudwnsvg2vpdwrsea5ik665xxafsuz3iznvjctw6algz2i@amy37zfoumoe>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-2-elson.serrao@oss.qualcomm.com>
 <20260703-manipulative-mauve-centipede-f8c95e@quoll>
 <2105eecd-b2e1-48b0-9795-ddffa8e43937@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2105eecd-b2e1-48b0-9795-ddffa8e43937@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfX8fc3kz9C45iv
 aubvGZXnsRS35Makj9wJcQlQ80/Q6qqHQ1ib09mCZPvEOMiKedKWOsy6xFkZ1h3dgMFVX7YkdK3
 pzaEXh7887WSlfxySG45bUR5IGVmZ4/V+XA1wSGSdaQ9YOroos94wzI+MoyXEOC1zz55iPa0ORu
 xKa9cKQFTeG1Rh3rBv2RJ2GAnr0LOBY3ojOmm00kqCviGWcKAmFNfsYqxlTlFBonJ4Vb+VXDWaw
 kQaRDQ8pY6ZsXRDkud1y49nogKMo45Y009lbwKVyiZmlxMsj79Xo//IeoFkoiUaUcRmG5E7KpTR
 fJ5XC9RqHHeHJdF6djwpGct3wWgIG7dyYbArO1rBtYdKoF1oFJ+xMTtSOzVIN/J7PZB7gV17ikt
 Ma+ihrVrBUc215UuztY4SOB8ehL5KdsgABWvkt/zlSKEOiKIo/w4AcokhAoWEHOKeWdmjJCzdFu
 t/3zjf03TNIo2fzVtBw==
X-Proofpoint-GUID: -1PlzGVPoX-AiaU_Nqjow0u6caDoRNl4
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a484d67 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=mYtunGRVIO_ZSpXlA2wA:9
 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: -1PlzGVPoX-AiaU_Nqjow0u6caDoRNl4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDI0MyBTYWx0ZWRfX3rfBieOZL8/x
 afqCCZ16MtC1A0/GdyzMggNX028KILrS0aufL/dct+o4IjEv9h1OcUJl5oK/nM4LOGVsYfA4pfc
 t8MCmpVsQUnt6lVF9KvovZRJS6MlL0s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030243

On Fri, Jul 03, 2026 at 10:56:19AM +0200, Konrad Dybcio wrote:
> On 7/3/26 9:45 AM, Krzysztof Kozlowski wrote:
> > On Fri, May 01, 2026 at 10:06:27AM -0700, Elson Serrao wrote:
> >> The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
> >> independent High-Speed UTMI paths, depending on the SoC configuration.
> >> Each path is distinct, with its own connector/controller connection
> >> and role-dependent UTMI routing.
> > 
> > You miss SoC specific compatibles in the patch. Binding describes ONLY
> > SC7280 but you claim here it depends on SoC (not sure what is a
> > "configuration" of a SoC).
> 
> The hardware configuration - some (older) SoCs don't support muxing
> to another port. The binding only says 7280 today, but after some
> version of this series lands, we'll wire it up on basically
> everything that came out in the past 10 years

Yes, but I'd also prefer to see exact words / platforms / references
rather than vague "depending on the SoC configuration".

-- 
With best wishes
Dmitry
