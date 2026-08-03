Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2173D567E
	for <linux-usb@vger.kernel.org>; Mon,  3 Aug 2026 09:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785748985; cv=none; b=HdAkZBlvN7TBJf1BAWjtiU5lI8Z2kLnBvdqVPY74Vo0WnvgC3xhLE6a+BHN2pVbt6PMYjtJNcZq38W6sIZPigszexKpoa7Tn96LhFpAWHeLoBFCkBShiszejwmxjpFJE5wVY9UDgSa600e6YuyCcBBC1VTWr/Y95fuKNSShUQ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785748985; c=relaxed/simple;
	bh=X9+2nJe4ug/gASVKfosspTsFtedg/NhqFpFbQqpYSoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCJtlze/zxlZe75Bioi30FGk+ezOKa2MjmchvTRKD9lxTO/URj+D1j/4Ix3Aka3+Ymd8J7jcLb+dn996/95m/eWaup3tByeLFacESuMIVhfqfnLU2Rf66u0+isYUSGq8Nm/gFKYwXQ8+NDxc2ZmuVS2ETR4Aa4fxeLFmgOSMie4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIB9ZVgR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0I96Iy/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KIB9ZVgR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0I96Iy/"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736D7HZ3654629
	for <linux-usb@vger.kernel.org>; Mon, 3 Aug 2026 09:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1xNhHRmjBylVBe+cBFr9X9Dw
	KitUCaw4odoWX3q9r24=; b=KIB9ZVgRp/HQeDoz/1B9+P/rHvjqgoJcie7rwDvY
	K+RX+SoM5fuaWyAGMUN5MOg1EbyKis91D/4QnaDFkmXoGZkJJk1mkttWfPxdlyzN
	YeAtOB7IATpgBFmzcyJTSGtpCtH1csoQ8meog3+Jjy+65mdLtAw7znNOyVQhsGq1
	bso+Z9rBnR7Rv2krZsl8Ubx9i/QBPSjEBZ9s5O/+iLixLvyUAHkSnTRSaNZpTV9y
	mr9uKHuOAgGPCQN/2WPNhCcvv21AEy+jmlvApaoo2mKG9UDFauyx0OSCdcvGlfYS
	5yOogT5mPrHckBbTCQRlxEBrzaGgVV3N6KiW6RqzZqUzzg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhb0us1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 09:23:00 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so5027439a12.0
        for <linux-usb@vger.kernel.org>; Mon, 03 Aug 2026 02:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785748980; x=1786353780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1xNhHRmjBylVBe+cBFr9X9DwKitUCaw4odoWX3q9r24=;
        b=O0I96Iy/kiJEhFIb1wmsC5PAm4JG0P0X8pVajMnLdEDavLxrUu3fhu1QuCn8HHUMJi
         mbaKJzTDs1XajAs3gJjkgr25kZsEkCIsRQBwpxA3Kz60uH6E3YsfIjaWpQ3+cbvAfM0h
         yGZfVtYGyelzC8RDOQ8CaWuFrYdPo4sNDgNR+bdqUlYFNCW550ouyATRwEuXylaXTY5H
         ox1dyAf9ttXQSgY7024++4Z7Y3HmBAHnTZEheSPO8yDWz+58bMcKrv/BQjTbwRMlGN66
         stbfDvVyQAten75/B0/yBwvKKa3pr/oA0WS1QOCEgHIDmaqQZ6hkfg8oLb0cOLrPlMPG
         Os3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785748980; x=1786353780;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1xNhHRmjBylVBe+cBFr9X9DwKitUCaw4odoWX3q9r24=;
        b=ARqzh16n6LRvzM9U38z1DFVoESyeukOF4eKzo0bucFFncyXYp+vO4HjIn3DbOBH9bu
         lBr2QSNU1spoZasbM/dqGlUqn9kpBsnXp0emQJ2+efajUnbcpXNFZWhGVx8O58Yan4sq
         fuyYjOps1L6rnHIU/lWyx4q6dGTu81lDT8Zrb7zkbzLlBkFyQ5/jwlcpACQkaaR0Wupt
         /GeXusqyvwnJEO3aHsoZr0X+4jKLKgglDhf1Y/Qv4AnDcAF/dOEuV8KJVHq06TfhKZJP
         y1SjgH8ZdliiSZo02CN5KWAB8/efPT/mnQ71HdBHQE+gdSUk4drgSBsfWLbnxay1qGDH
         ijhQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnQdr1238KMqS0kTKru50eIa//K4Qo6bQFV+zGYnv57qrp8eB5Bb2u/KA3uU00dhFRnyku2sOH9eI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+GWe5vxhOoNRsYsnTaI1uQmKtmzqnwU9NiSBQnLx+aEqPGbpy
	pAr23l4dXZKsyu0j+GkqTttTt5WUe5FtKp2qdvlajib26G0TfOP3d9DQMNhajN/MPHUo8bkvRYi
	oZ9uTQF4FGhAMe5uXNNnsIyxNM5GiLbuiHaghXUQm5nw8tVzl+cnnXUv24bhwRZM=
X-Gm-Gg: AR+sD11btQz7D0ZdV/lSrAGP9Is7//x7US2iyZxz7PTEWSUFqyfnnpWQvT3Y9bPUawQ
	mjCv6KH4I0psVx6wL7a3sW3QWnz4cdKXeFcV5M2i+Ng786sU5NS7YMFdNO2cEqOBnzOIdpgH7/l
	7oX+8bB+TfOg96irQ2YckNuyJuByLiMViay4Jf5fKJAAF7O91A66wR8/adLM2ZOQ/fqqF/fBmea
	5b/KPJ2gHbbEcsZnauzvjj9fi+IUR9cu9ulKWCVkja1JWCeY+LsuX2B9cff012ZT+MafQQauJI1
	P5llK3igAEdi18/IN121oS+tJzwFvmR1jgVrfdejJY+x+yQw6ddD9bBKBRlJC9RZ0iRyBpHvxCA
	BR+BgxyIf87zjfDgAeIT5mQD5W/0=
X-Received: by 2002:a05:6a21:648c:b0:3c0:9c19:658d with SMTP id adf61e73a8af0-3c92a89b8d5mr10122640637.71.1785748980303;
        Mon, 03 Aug 2026 02:23:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:648c:b0:3c0:9c19:658d with SMTP id adf61e73a8af0-3c92a89b8d5mr10122611637.71.1785748979783;
        Mon, 03 Aug 2026 02:22:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06fc98sm36259828eec.21.2026.08.03.02.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:22:59 -0700 (PDT)
Date: Mon, 3 Aug 2026 14:52:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>, krzk+dt@kernel.org,
        conor+dt@kernel.org, robh@kernel.org, neil.armstrong@linaro.org,
        gregkh@linuxfoundation.org, dmitry.baryshkov@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        wesley.cheng@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] phy: qcom: Introduce USB support for Hawi
Message-ID: <20260803092250.ucoh5qnnnyurgyzu@hu-mojha-hyd.qualcomm.com>
References: <20260508213234.4643-1-ronak.raheja@oss.qualcomm.com>
 <chf57j2dkhhjzigpguldadfld5utepa4sxwbo7fjxk5nq37bhp@yci5agzh46ly>
 <al4EG1FMrI0z1D7z@vaman>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al4EG1FMrI0z1D7z@vaman>
X-Proofpoint-ORIG-GUID: IBvycOXctGGUfGSh79LBE2YZOBTq8MzX
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MyBTYWx0ZWRfX7Gk4w4Gh+LUt
 OIqEO6uhE2/RzjB3fZ20BMvzj5ow81QWgtymGsJKh20UuLRlrUzuoGn5rYbipV5MpvAAHvGRR8f
 MmZZlUDO+sWY84XV1lN3Fm5ricb4cZM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MyBTYWx0ZWRfXw0M1vQ8ciLpm
 41J2rvi0WK3zrRy7Maq8cDzql/KQqqyciMxTl33Y9YIYK98/gnHGq6OL9xiDnkpXPOnNFP7WSO3
 1Y5+7w6xupv6OxUrSCH8kZGcViuLdYoiryxFGWlkspXT/C2TjHQUDDQJwTbxg4DV7p7tjHJi9M+
 ONRa/0KyVC7J8JPrmIh4odDmVZi6PyBsZo8af9PCwR2Pef2rCPSm5lPJ8HiBHsDXZlUbYfLZEYc
 nd499Ro0Q/Q3W3josr3nf64vOxXPSumuoPuwRg72LY7fJOhmDBaiwiBzn22fQmhZs7HO346kI/g
 sexN4ClMu7gOBQt0mru4nQnLNxo2YFxgeXuklEec9P5tB6ZkFIdokecuu31mKop63jPN/bmvxw7
 b7o8HfuT62Q4jAsgO2CeQrW3nWAbUqJcembXNulqotd+MKS4oVFCLMyeZQ72Dc1FlNUWU7/dgXe
 a2z9C/uLpXZ4L/vquWg==
X-Proofpoint-GUID: IBvycOXctGGUfGSh79LBE2YZOBTq8MzX
X-Authority-Analysis: v=2.4 cv=bKEm5v+Z c=1 sm=1 tr=0 ts=6a705df5 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BafedZZDLhzKb9y3GCEA:9 a=CjuIK1q_8ugA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030083

On Mon, Jul 20, 2026 at 04:48:51PM +0530, Vinod Koul wrote:
> On 13-07-26, 13:12, Manivannan Sadhasivam wrote:
> > On Fri, May 08, 2026 at 02:32:30PM -0700, Ronak Raheja wrote:
> > > This series adds USB PHY support for the Hawi SoC. It documents the
> > > QMP USB3-DP combo PHY and M31 eUSB2 PHY bindings, adds the Hawi
> > > compatible to the DWC3 USB binding, and adds the PHY initialization
> > > sequences to the qmp-combo driver.
> > > 
> > 
> > Vinod, does this series look good to you?
> 
> It doesnt apply for me, can you folks rebase and resend

Sorry for the late response, sent the v4 here [1] rebased on next-20260731

[1]
https://lore.kernel.org/lkml/20260803091441.3040830-1-mukesh.ojha@oss.qualcomm.com/

-- 
-Mukesh Ojha
