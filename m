Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AB02E7396
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 08:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214334; cv=none; b=k1o9gvZgvYykyBqHw2ay/giCb7oddx7eKk4/0Q4PzAku/21IbNnGZyGS/bsmR9MsxGWRDILIr4VGgyz9NfaZ6/3IBNOx/0qyOSJzboyVkz3RgPxlkbYsWj2c4Aw7a8HGyoSWyUAuBtUlvH/qvQ2PwLR7SuPXTSFAQ5o+3VE6flM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214334; c=relaxed/simple;
	bh=YYyZ53DbcXWDtn7UM44D2X5nsQp3/Oxu5WxxX3MnfSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iox2RVoGAqAN4rCfnLtkuooE18abPph7wuwPEtnG5tUBvb+NQYicnxLMppnv4nkjPpMn45D2HTJ+8/dcO+3nz3aJn2V+WrrllkqPurzUlzu1fD3q30LHb4k0iInDXoSbQrPJb29wGnFxdeYq+i/qy4BOfPSjRtlgQ7j6aKJEGQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZiWaisKm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWtL2g7i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZiWaisKm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWtL2g7i"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8PEcR2465462
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 08:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=223qQlWuY3f+8iK33zdbyvUr
	oKwN1OIa3V2war/hhpk=; b=ZiWaisKmLP4/ZEJAJktEotllGzVr3U9erUWQesZl
	K9FWNzrFitsgOv6Tqy2u/RoBU0vmvgBAAWV0qUVjj4fbb5mNS22zZ6Ltq59ujyvq
	skSRP4q5QmNngi4tpckc/lplVOF/Ars/V3+mmJ5KbPPTZMQU89j2nKl26o4dRT2v
	QnzLii5ZsTZ4SVlcXiCZQursU0D2osCO42AkdU0YAE9GTpnKreQZxOX2zDDhLHiY
	/55OidG8lVxkQgmV17BO7GIFO1TibLDYVKvBh7/qcbwFuP8jS0KL/36JGU9rNw/E
	vA0Okrpm0kegm5P3LzfUtSWFVHUGcNdlRPn4u0EZFoBwHQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x29g022-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 08:25:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9368f2b7b2bso207138985a.0
        for <linux-usb@vger.kernel.org>; Thu, 20 Aug 2026 01:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787214330; x=1787819130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=223qQlWuY3f+8iK33zdbyvUroKwN1OIa3V2war/hhpk=;
        b=TWtL2g7iV44SnfmO9G+xE2uwiiGK4WFmu14YVID4x0/JyBxWx3izjWLT+CQScEr9ZM
         ixrxtEXR8OiCiJ1xwZ0xZknQ7fz2JKYehOX41UBJ0G1GMx9YuwdvqaG7OZJ2/uJfiuCg
         dAfCImWOWi+J8D3zZDk7ZiNY6jKPDzaNTpY6sB15qX3w4OHCDMkKMLBZJ6KyNYOMhkhO
         V38J+Mbnt32Tdikm32EXJh7PO0z0hPdIZl8DxsSIiv4YmNqsZEREBYsU3yWdTFGIVhbP
         4BnRU4zUddQppee/yKRXr7HjIb69XdG8babh0+vBv1zLO4VA7UwkbnnuxWzZ3Itz48Eq
         oXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787214330; x=1787819130;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=223qQlWuY3f+8iK33zdbyvUroKwN1OIa3V2war/hhpk=;
        b=QemrK/+6VYZgBvQzxlGTcWb9PQ8tSFMZoKFZCg056ceAdJ7PJgXwgDM7aIaViV5wOk
         2CpZ9Pap+HnGuoOw0Mgus5Kiw9uZKUpkxgAlfPedCcw9at/hcq4dEwcE3e4e+3Vyyr5t
         lw53J6ccmiMPTkhj8mErkG3KzLtNH6A62pnGmFp7erMamCmuKoYA9ZecXWZDc9/dcjrP
         ppCYli8J9PRYt6+ngaVzZORwN9ZBab86rsoAlJYA0pbwGWTUWX0CVwqZBbEISWOatCSj
         2FtjkjPpUNgYk/j1s+QZXxpL/WKtEYku43v94vExCUQvG0Zx+5w/rvENxFKy1mqelkou
         gbYQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAdruTUddDsMUeyseTCstahQqRx9BdZnsHrduqULr4pj1n7LvzI6W3l+Xj8LwniFcHPBD7bnsBlFI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZZSyqKw7+R/qS9yAC8XMWEarfXm9FLTYq5sY37BbscsqNEQpb
	25EQ8QMN+HP9KVSuOwmP6t/gZDv4uAzNUYaqeYNslNOypezz3MbT/rjZJlDi4EagfW+rRS/+op/
	XBmZ0FXGFykHUXkgNWEJ338tsLIh00gcwYTm+7SQJUf7qms7xuBeSidmK7enagNE=
X-Gm-Gg: AR+sD110ALhb2r34EHPZn8xqheAZXDZ/6Pyu6bDqA6UstQbWpa3T8G862xyZ5rR/BrR
	scVVz4AMGj4MpUTllrdcyWKRb/YNUIKbqzAEFQbswXBGSu9BXnGajT6+bt7zHfZR/12XTfGvtjm
	5AGZOaNcGD+X+zjCbLDszlNnqN1r6IgqpKr7CBAmna9+gc7mPL8cCAlJjozex2joNPq2HKGaXXv
	mftp4hlYNiLyyPEa2TEporktr4cmSme8faFumRhUsZodpPn985piIEf/2M6/b7H6PKvSfJjdiau
	FqOuF3664hBPIbPLFbwDoPKQ/HirA2Hovs9iOvAKpM2xEWcEO2CredmnR0DGSbcUPWEQMAvSEA6
	wtDXxdjseTn4xAjs=
X-Received: by 2002:a05:620a:171f:b0:92e:46e5:8f12 with SMTP id af79cd13be357-9371e2ffd67mr946976985a.30.1787214329884;
        Thu, 20 Aug 2026 01:25:29 -0700 (PDT)
X-Received: by 2002:a05:620a:171f:b0:92e:46e5:8f12 with SMTP id af79cd13be357-9371e2ffd67mr946974785a.30.1787214329361;
        Thu, 20 Aug 2026 01:25:29 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14514d5sm11809010f8f.10.2026.08.20.01.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 01:25:28 -0700 (PDT)
Date: Thu, 20 Aug 2026 11:25:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Stephen Boyd <stephen.boyd@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH 09/10] ARM: dts: qcom: msm8974: add the HSIC USB
 controller
Message-ID: <oocip6a35iv7wsxtiudapckeklgv34d3cigftdc76jinixxy37@qdd7xsjxvkjf>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
 <20260810-msm8974-usb-hsic-v1-9-e5f93ea76ffa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810-msm8974-usb-hsic-v1-9-e5f93ea76ffa@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: WfYTBnyyz57YHizrHKILY8rsBNSfJNRj
X-Authority-Analysis: v=2.4 cv=V8BNF+ni c=1 sm=1 tr=0 ts=6a86b9fa cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GX6hXX8UDECmu-q5ZscA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA1OSBTYWx0ZWRfX5jt5C2MSZmEM
 HRbDxUc9gM2soQ1VL6wKwFkK8DMoCu1nK1kbPatfJFq9t+dD94cJ9JFLiElNbvjMASrhtHR2BhW
 TEIEqRphc0/WPktc2qUhfusFmACdnpHECkB/TcGkhruGZTv5tug+thjryz2gBlF9GV4It6qKaKC
 zz11OrlUOpGmTSPndRyY/SQdOMdYeky6vcbuI1fs5HI6ie/1DE/QzBxuk4PpcodrSqXC+hh2fYs
 sj2cpF1fNKLq9ZHjtU89NdLPtOgDK0hM7IfjMfSGPW55kNAUseqblPVCGR5DjjuKOLlLFR3EXZU
 egrzXcpAEahQE0BuYuNtFzYpjPIY1YYAlknjmdmBilrrVfaynjprfJ3z/YDGBOhrYSL9YOR55Zu
 rXXm4BGDoRxq3oeEwM9QO6tnaJrObj/LkWgVOTAmgF5OdO1/qdbSfoJnVcVS1egrMdn/jD4Iu9b
 RuaY0/dANuAFVk6J1Jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA1OSBTYWx0ZWRfX0VHJFFL6l9uX
 E+SPt2wbMtaaVSmKvQLpjjt1c0Bd5UGv0zX8A8OEU453tVLaEXIsL0F/4iKUH2TI8rbX6z8cAEW
 MLePkM5Ryk6Sl44wu/YoKc3SKVekUi8=
X-Proofpoint-GUID: WfYTBnyyz57YHizrHKILY8rsBNSfJNRj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200059

On 26-08-10 18:42:13, Dmitry Baryshkov wrote:
> The MSM8974 HSIC USB host - a third Chipidea controller with a
> dedicated HSIC PHY on the special hsic_strobe/hsic_data pads - is not
> described, leaving boards with HSIC-attached hubs or modems without
> upstream support.
> 
> Add the controller and PHY nodes. The PHY is a ULPI bus driver present
> inside the ulpi subnode.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
