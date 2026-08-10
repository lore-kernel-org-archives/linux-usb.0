Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C02641D64E
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 15:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376552; cv=none; b=Tce5Vo34CJouzT2LwDUiE2cSTrH9xGczEiNMSGc6pIgyhHNDUhPg+r4tI55RutGhZSxu6Yx3i5kRL9t3LpgWaZvLCGtfuY+owDardE0feXpFIifOt97Gv+l21zOJvrW+SFlCNYRtenlQgbwYoXykrKJ8GixaY1fMqZyrXQC6icw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376552; c=relaxed/simple;
	bh=R49ER/gxWRxFuxGE0BY6zWUSKOzrVJjau1n5zkgccSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wh81fEiUKJODowe7LUWphEmzmI7kiy4vvKuo1lBqnqHsTQ97RdJ7dBzrsxjZAZo8rct+laUNOh261dnIPAS5HUH/DPtWk4F3pDx16a+i1w9qAx6RRqDO1FVBuhPdZf5u2zn2WpVNUlin8HDIvR1bDXHo/uebdkguUoyGM7oS9WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLk9K5Ou; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0hikHOH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLk9K5Ou";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0hikHOH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AFWLZB1754335
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 15:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G023oLebHt08Iu7D2qcmQMAHLSYQBvIdenvFL+u+nwk=; b=SLk9K5OuBVnrUOZC
	rdbgp1eW96WQpkm8EMy01WP0jGIJm+UHURPbr8FxxjakPCIlNo7rrTkY1F70+ZUa
	TGl2nLUpCe5rlF3jhFVCWxIe0bMsTXSVq4J5QQ0VFp/HjbzZFvTJw0g6F8bxQVqy
	8tG77u7nhwjz2ClrDzQ1GD3G7miQAMxQ7K4Gv/CBsDD806au1cE+NLCPBl8zf++f
	embyyuGU4P6S8waNtkpgHUz2L5DE5ZEAFGdz0ZGoY8lSIpPmLTYEV1O9jwrDvAME
	P4Wz9Jvbow0YALM+8Bdz+sTJ56bTguzxmSV77o0rKEmyS3Z8tHvdZffYQdZSHE51
	vm0R/A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v4aa9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 15:42:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0e702df8so28586561cf.2
        for <linux-usb@vger.kernel.org>; Mon, 10 Aug 2026 08:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786376548; x=1786981348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G023oLebHt08Iu7D2qcmQMAHLSYQBvIdenvFL+u+nwk=;
        b=O0hikHOH0VLYUFt2uFx/QXMCsr8l1yYQ7BmYKsnLAez7bOwhhtZ7HytFJDCnvO5t4D
         3ni0MiKYKyzz/d6pejjy87IsQHh4ApmqDphDeQuMLIvzfKIx09HYeiqp40NvtHmrMtxx
         YfLZUFEHi+fn4Cjvu8P7q/SoapgmJe9W1ToV8a999TIxdV4iRRvlV9drH8OjZ4rhhZdm
         5SpfiVQ0GLzobaHWPUJPIwKq6J9APZ+bLDLhw4riAhujj7pHlfNto9hoaxeo8a/KCjKY
         KzIuAf8MoH9FS5jrMTNSk7fCCEJjNWdBlHnBtcUzfNVBSBbo4m8FQDA4cQINnTw6bVmL
         DuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786376549; x=1786981349;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G023oLebHt08Iu7D2qcmQMAHLSYQBvIdenvFL+u+nwk=;
        b=nDijUvJvV2ajhaW7EW73PBxtWIHzoMejjI9Aswr732SgyvZ2Ld3onN6/d2P9J65tVI
         ckevttTEp0250aQutkdkNkEBv2GQnTYNe+hk3W/qGOwlQuLLkCSGMwOj2VphWlVra+xh
         tjS3c0bDno5UfHx1ixYjS1Ln83UIycwSJ5nRk5Jb+7pPFqAK5E+dm08uEAarIdjcggAC
         QzcS6vLHC5hd6rew4lL41uyVZLdoVzFZ+2vbhEBRf1xt1ET19D77u1g6H8VIQ3n0H0la
         /0t0HnXAWOsgLBiOvh+tzo1lmv6xigPttcpOseBRDYbrCGc3MNZPZXi36zYuScQqbJ/r
         8J/A==
X-Forwarded-Encrypted: i=1; AHgh+RpTVY+cu/kzzIL/IoGtd70HyNDA6bpvZ4rDFFozEHogTLQgLHElAKzOki047DxH0GiPhzVEvWRtgOM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2yEvbnHdI4+Fh0sHnnT0oaU75x4nllaiXNmVvnTCFwglkFO5G
	MxOtij2Kzxs1nEapJS73e55qi9wji1sv6I18TnJSULLrfKovrzT5f0ab3Pa+gRFIUJaokWnH6hT
	Vh/Gkf9yYcf9kipJLtvi/M7EustsjSypCFRZhlH6T40qivOnt29EUsIFqzlJNqTA=
X-Gm-Gg: AR+sD11OeMPzHl51M/synnFf04cfKugbg2KiGz8RzkGrjTC4XhGp6q7Fh+Zh5qbzIsC
	Sl+HEQOTdp/2FNDoyAh9LLNtqxsxYdVcJl4eBCXt6uzttakhPrbXYelnjeq2VYTbC5Dy2af32MM
	WUqcEN6IFGxxwzdyCGGquNfvUVX4UN3bvxa8yXkqZnS2M8EtQ0//aZf1Y1AVw33ayvhe18nfmDu
	//ic4b9VfABIf+DsXCpBgIKgODYfXSJlibpjMO2BY1m5SnUswdW9tZeIi2rFvrYhwML49LUg5/r
	BXUXv0yCKuYKd/UX/LHVAMe6d1jkEaLFXqEOvu1D6NRpIwVE6a4jhZhnihlvuGbiZdgKovV4SYE
	Gm/J+riDG7BKwJh3j+7JGK8tGF7C+JZmqra0xkAQ6UPUfJLvJ5IVxnvsem4dxLkQtM27iDFVuuM
	WyLEsjhJEnqUMJfw==
X-Received: by 2002:a05:622a:228d:b0:516:d699:a99b with SMTP id d75a77b69052e-52ce61f545cmr485605371cf.40.1786376548377;
        Mon, 10 Aug 2026 08:42:28 -0700 (PDT)
X-Received: by 2002:a05:622a:228d:b0:516:d699:a99b with SMTP id d75a77b69052e-52ce61f545cmr485604671cf.40.1786376547907;
        Mon, 10 Aug 2026 08:42:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3056f1bbdsm2071673e87.82.2026.08.10.08.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:42:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 18:42:12 +0300
Subject: [PATCH 08/10] usb: chipidea: host: calibrate the PHY after
 starting the host
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-msm8974-usb-hsic-v1-8-e5f93ea76ffa@oss.qualcomm.com>
References: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb-hsic-v1-0-e5f93ea76ffa@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
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
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, Greg Kroah-Hartman <gregkh@suse.de>,
        Peter Chen <peter.chen@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1522;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R49ER/gxWRxFuxGE0BY6zWUSKOzrVJjau1n5zkgccSc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqefFRaxbm8F1hM5ExceXw17O2BVdmuXAN+50T5
 3dOXwsrWl+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannxUQAKCRCLPIo+Aiko
 1ZmYB/9S4PXJJai/uHxYRI7nxMrsVvpp2b+iA+rEMo9LCswUf7RBmFudNegJUuknF9U6NNGPSeR
 88vQVX4Hh2wdfwLgLhN0vi63hpMJGo7u01+G5ofvjwRYoVm8uYpuWe6H0sXvmPPdh7NzZ9LT/75
 A97e7bvPfBxLYnRTeiQB6SffN/11ZcKjZvp4n+S4kQhVQpPBEvc55rOKI0VBgkMefBU1Y1VJRYK
 ZMq/GD4B7GsNCYRBdj+HyIiK1cy/dInPM3ZpsHawE+k4q6U+9wMedJtl9supoeuGUycF0gc/fr6
 I8LeTJq97zdnsCZxJBKuUJDhkv9Ok/6frP+w+lcAYFd64Cu6
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: fcXXI-ul_aNf5Zl3QE2npvXXz77qqp7u
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfXxYseu3D7pp6Q
 8EaRaEIYIw+L8U8Eg28WZXWET6I2kRArFZBGJIfoqx42D4ZL/WOPv4Tmo8+8fvRxg0eAEPBm9qw
 c2XbBgoAC5lOsmaKlH/7NwvCtiBpbuk=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79f165 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=eoJ_6RDj2L3Ezgz4JzAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzNSBTYWx0ZWRfX4kqRTN7zQ3vT
 xcSG7IKK8Yyps0PbFoYlFo0cd4mZ8NPqnQWlTTiyD+0k8L5eWf9Kdy7Y3tYjNZm/sqV/2t+XDvG
 k+p8EihiHCwByNuDLGtlgYbktS2XgLZQPYnCMAE1iT3BT9JOBDcJIp6ANZ3m+miD/4j0ACJYSsF
 GUh/MEO4xiGeBoCQgZMCC2LFA3fVLnbHVmWEijeJp+k+22n4/zaK5sTzG0DeVlHSvmn77NwNGIV
 nR6HhEcW5mPKALPtYOwl+U6buX4oLH2rJYJfiJzjIy8iskI8b4IKfetXgmvLYVvwSztTn+UTnTZ
 4f692SIhOVKS8SBb5/yr30d4+WrhhbZg5tIbQtbFep3A5GGphgoJqczYXU+2YkXFmLO5t8ukFtG
 ZRBjdrkuRTTCgGq9yqPtK+VSSK+uzEVixTZAq2RkDNYJUQ9KKfsWGieUpWihNlqMtcZxz0FvsBz
 soByW0Qhjpa2gB0MEyg==
X-Proofpoint-GUID: fcXXI-ul_aNf5Zl3QE2npvXXz77qqp7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100135

Some PHYs need a final programming step after the host controller is
up: the Qualcomm HSIC PHY latches the device connect at the moment
HSIC mode is engaged, so that write must happen with the root port
already running, or an already-connected HSIC device (the strobe/data
lines have no hotplug) is never seen. The generic PHY framework
provides phy_calibrate() for exactly this kind of post-init fixup and
dwc3 already calls it; the chipidea host does not, leaving no place
for such PHY work.

Call phy_calibrate() once the HCD has been added, next to the existing
i.MX HSIC active-event hook which serves the same purpose. PHYs
without a calibrate op are unaffected.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/chipidea/host.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index ced6076a8248..62bb2999edb6 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -15,6 +15,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/string_choices.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/phy/phy.h>
 
 #include "../host/ehci.h"
 
@@ -192,6 +193,9 @@ static int host_start(struct ci_hdrc *ci)
 			(ci->platdata->flags & CI_HDRC_IMX_IS_HSIC))
 			ci->platdata->notify_event
 				(ci, CI_HDRC_IMX_HSIC_ACTIVE_EVENT);
+
+		if (ci->phy)
+			phy_calibrate(ci->phy);
 	}
 
 	return ret;

-- 
2.47.3

