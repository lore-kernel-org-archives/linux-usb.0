Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F07F448B83
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796641; cv=none; b=FoxhHEwVT2CGbeM2logcGe7zgJ1vcaKMH6LlrJ1QeSqgYKkTEdoJ4/bfkDlLkdStDpm33OOTGhrNze1CNUKssiskkEPr+e7GY3Tr47aRvZwpRfktCUl+Jsza6he7iMNxjNVFAztIe7xUAZebsLSoCCtY5ufo/lmeVBzH4CL6Pv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796641; c=relaxed/simple;
	bh=t5/mj3Sq7aDs4Mlfmy7kHuVK1DOPLoOZndF1AvJXS5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ClFqU8E5CJssbFbC2Hhi1KS0Jyet9Gz9z73PDg8Sf18rUqbZD2vuw/K3ISWt+UNaEDWuF184D2Oavdyyew/WDqHXpHHtoNZjN2+V1b4xGarX47oreZhw2UBMX1DGYFqDJhHjYVdYn2acyhtpL7PuHL5ZHi/e/ANBNUm0z/4EkUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JlXAWjGA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0Ta39X7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JlXAWjGA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0Ta39X7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KAe51779281
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 09:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2q54VpFxghh
	/r2vqer/NoH9EgB+W1mrhbzT0q1sHPr8=; b=JlXAWjGAkIJvbqx0eMAmUG4J0NY
	63xfw71Sy6OSuW/QXWaiiGGOCj4LhZFJzkieqUJcEbLMJqSm5/S4j4RP46uBkOTU
	PCTvzzBEl+8yIteRDD2H9U9p1bTQXaOtk6TT4alI0+HeBco6G6xQ82eCqJ9dLMxQ
	dJN+ILs1NDsgTFKuR/czSc6B5UhVEuAkBW4iUZ/cWZ+JSNloGhUvVxDB7G/xGi0i
	Y03hC5SMA6Oj0iGk3cOOJ5IcAh1WD4e5QAe6vYxCv9gi0voxoypecTSjrLifLCwL
	8sCev85coLImQvKyHBT+mOYpf9q/1Tx3GxkdNC4D9zNDvgeUeNBx+ZXJscQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq0cwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 09:17:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso4426536eec.1
        for <linux-usb@vger.kernel.org>; Mon, 12 Oct 2026 02:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791796636; x=1792401436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2q54VpFxghh/r2vqer/NoH9EgB+W1mrhbzT0q1sHPr8=;
        b=h0Ta39X73DbvU/MhzdX/aBkZsNyuv3zO6okv/CfPt2fEFwmwbwQzekItFdwofWh9cM
         4UNIXcS1QG/wo7J61/O3xIuI6DSdVx/YMSc5k/SiN/AVgkXo2ijH2n3OzVkdXojNEgJd
         L648smcGQRogtkCaK/DY96Ja3qSHPE4hgHzbdEmlIErH8KoGC0YWjzWlZaBa5OlaPybf
         L/Os6p3S3ZXdE9EiHabxnLKjTJRBngYCw2cv6hP8mARAFCmMDLrSqyLgsxxPk6o/p/lf
         odz5lTFyx/qERhX8GnJlZMN4NxX3ww9v1u15hEV9ub+0bwSOTsNtPixnAszXjnMPgWzB
         TYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796636; x=1792401436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2q54VpFxghh/r2vqer/NoH9EgB+W1mrhbzT0q1sHPr8=;
        b=NzPCiUzVruOyHsKij6pPbbIelgKg04XbIB7hF9bW6SR9jACSIIDLd7kJmwL1R+QuJe
         IOXsconDOmyJP9IqS6QK/R9fuvuadtkpPl6nxmArXQhZWf407iHxl7CaSkUfbnvbfkmm
         DtkxXM7Wdl7yuLSFtID5Mj8WIDwNcQanGoswXFg4tAJgN2ZRPxEHDhhhAmOenAKFQaGz
         zYjUsg92J8/jsm2MIV8ZLGtImmJRSxcxq2KkBfjg3V1TOJ6+OY8TAQi8rSgW4wWbiGco
         gDaBVo+uxlUOglb60JkdoCVi/neLTCuarQTpH/lu7zhQT02F+k9vrYQdA/yg6XQVBy3Z
         KBmg==
X-Gm-Message-State: AFq9FYKfSLdlmuHD8ql0bXJOubtVMK9XuE2UNvr6E/EONbcO8dPGARlY
	6wsGh6QcK1XnA+p3JQ4uAPdj7tf2m2Ud/mvXKqo5ESNNbfByhhGOzvaQTiU+ej652GVMiqGRQ94
	cpK6yyUmEmzzZe8F9VNTz99piVe2hDngvIoWtmE4IPNZ428eylNFQlsJJu6OKu9U=
X-Gm-Gg: AYBFou3Uv9mHUKWqG8VmbbE0RXv3+1/0RnOS6ylUJiS0XTDycUVjCBusyeE2H3D5WOC
	hOmMgTykErvIuug0RU78JZz5mn7MXn3urBfUQetlYtbO0jZqXWXm7vMq2WWibwWmuOvFrMNwC/6
	Z7rNiJNd6p0/EkFb4LVN4Atrx2wxbrQPGG0kblZe9rXY/S7qQgimW48HSXfyUUDjzRf9NO+wA5W
	l0ox1Grbr8Na293o5OOtRyk7+POySVSJXcK0boR/P6QufDzzBW6nroxWEMsE2aLn9N6IwRZy4h9
	1rUXZbfw16dafBMC+GFIlPv52p/3ef+bmyTo2GHsc2c5WXupu80T2y2JAEkWxlG/7H3T8BPpchE
	FCECM8Er5Ua8jdNI90CY+zMgs3u+V
X-Received: by 2002:a05:7022:ea8e:b0:148:6b82:31c1 with SMTP id a92af1059eb24-16a6081026emr12085375c88.34.1791796635539;
        Mon, 12 Oct 2026 02:17:15 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8e:b0:148:6b82:31c1 with SMTP id a92af1059eb24-16a6081026emr12085340c88.34.1791796634951;
        Mon, 12 Oct 2026 02:17:14 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm34502575c88.16.2026.10.12.02.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:17:14 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] usb: typec: ucsi_ccg: Add cypd6129/cypd6229 OF device IDs
Date: Mon, 12 Oct 2026 14:46:58 +0530
Message-ID: <20261012091658.635441-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012091658.635441-1-akash.kumar@oss.qualcomm.com>
References: <20261012091658.635441-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6acca59c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=YH4mJkl8FC1W5lWNX3cA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfXwB/cy0mrsI3I
 btdEfeKlZl5d0JfTZ+oKyBxbkATi5gddgJ7U9B90iKeeC9nBsSrLrEgC1AnQjXOxbcMqo34AK3N
 +vHP6qmlyzihLz1PaKDP5tHR3icLB2w=
X-Proofpoint-GUID: eV6cq2NdAHaEzUrWw0zneCORRFaj1giy
X-Proofpoint-ORIG-GUID: eV6cq2NdAHaEzUrWw0zneCORRFaj1giy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX6E274Idq1oiR
 Mri9lP/34CWwn1Rge77gnLpFHW+G4LgFszPEB9Q7ufzcAdLoG+9hDCIMnsZa5j6DhyaPHLYrjmw
 +DwD9RCh4XV7I/KkgGnCea58fS7jtXq3+O+jP2hm0Q/7JADsjHdWhuz9+ziPYUfJ3gMlJ84FI6U
 zRQgOCduAYW6bBjlXiNH8PqVdNE97kVI68TsT8ykoT2LYWjiAJIP/iO7l6Ea+dRBwXtYWTU0HGg
 nsdYcAj/5S7d52MM8S1otKXyJNlUySsjf0s0MiUVcA0qZo0q9BaDMzqq17RTLW99PZImTRuxPOA
 8awnglHzIuPi2hkEmxtQqOvTtcqAiWcpZQgiC1e9MdMuNTO+qnhPHTmeuP0kyNfFVkU1FrUspV2
 RHUS+eCYsCzXD+DnKIAQH3rsanyVPu4Mvhs00YLokQ1RNmsBgUvOUiNiBekTbn9nGTbrnV5ZtZI
 bTIrCCBF4fyBTuCoBIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120036

From: Akash Kumar <akakum@qti.qualcomm.com>

Add compatible strings for the Cypress cypd6129 and cypd6229 dual
Type-C PD controllers to the of_device_id match table, matching the
corresponding dt-bindings update.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 3f12db95c7f4..34fde72fe0a6 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1556,6 +1556,8 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 static const struct of_device_id ucsi_ccg_of_match_table[] = {
 		{ .compatible = "cypress,cypd4226", },
+		{ .compatible = "cypress,cypd6129", },
+		{ .compatible = "cypress,cypd6229", },
 		{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
-- 
2.43.0

